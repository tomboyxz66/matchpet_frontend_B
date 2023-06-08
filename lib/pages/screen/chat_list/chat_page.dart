import 'package:app/controller/accepfriendrequest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChatScreens extends StatefulWidget {
  @override
  _ChatScreensState createState() => _ChatScreensState();
}

class _ChatScreensState extends State<ChatScreens> {
  final FriendsAcceptedController _friendsAcceptedController =
      Get.put(FriendsAcceptedController());
  var userId = GetStorage().read('userId');
  var petId = GetStorage().read('petId');
  void initState() {
    // TODO: implement initState
    _friendsAcceptedController.myfriendsAccepted(userId as int);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Chat'),
          centerTitle: true,
        ),
        body: Obx(() => !_friendsAcceptedController.isLoading.value &&
                _friendsAcceptedController.friendsAcceptedData.value.data !=
                    null
            ? SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: _friendsAcceptedController
                      .friendsAcceptedData.value.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.red[100],
                      elevation: 3.0,
                      child: ListTile(
                        leading: ClipOval(
                          child: Image.asset(
                            'asset/images/logopet.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text('Card Title'),
                        subtitle: Text('Card Subtitle'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.message_outlined),
                              color: Colors.pink,
                              onPressed: () {
                                Get.toNamed('/messages');
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}
