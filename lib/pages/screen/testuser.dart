import 'package:flutter/material.dart';

class User {
  final String name;
  final String imageUrl;

  User({required this.name, required this.imageUrl});
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  List<User> users = [
    User(name: 'User 1', imageUrl: 'assets/user1.png'),
    User(name: 'User 2', imageUrl: 'assets/user2.png'),
    User(name: 'User 3', imageUrl: 'assets/user3.png'),
    User(name: 'User 4', imageUrl: 'assets/user4.png'),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _swipeLeft() {
    setState(() {
      users.removeAt(0);
    });
  }

  void _swipeRight() {
    setState(() {
      users.removeAt(0);
    });
  }

  void _resetSwipe() {
    _animationController.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: users.isEmpty
          ? Center(child: Text('No more users'))
          : Stack(
              children: [
                ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onPanUpdate: (details) {
                          if (details.delta.dx > 0) {
                            _animationController.value =
                                details.delta.dx / context.size!.width;
                          }
                        },
                        onPanEnd: (details) {
                          if (details.velocity.pixelsPerSecond.dx > 200) {
                            _swipeRight();
                          } else {
                            _resetSwipe();
                          }
                        },
                        child: Transform.scale(
                          scale: 1 - _animation.value.abs(),
                          child: Card(
                            child: Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(users[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(
                                    users[index].name,
                                    style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return ListTile(
                        leading: Image.asset(users[index].imageUrl),
                        title: Text(users[index].name),
                      );
                    }
                  },
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if (details.delta.dx < 0) {
                        _animationController.value =
                            details.delta.dx / context.size!.width.abs();
                      }
                    },
                    onPanEnd: (details) {
                      if (details.velocity.pixelsPerSecond.dx < -200) {
                        _swipeLeft();
                      } else {
                        _resetSwipe();
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
