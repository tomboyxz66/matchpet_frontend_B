import 'package:app/controller/accepfriendrequest_controller.dart';
// import 'package:app/controller/pet_controller.dart';
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
  // final PetController _petController = Get.put(PetController());
  var userId = GetStorage().read('userId');
  var petId = GetStorage().read('petId');
  @override
  void initState() {
    _friendsAcceptedController.myfriendsAccepted(userId as int, petId as int);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Chat'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Obx(() => !_friendsAcceptedController.isLoading.value &&
                    _friendsAcceptedController.friendsAcceptedData.value.data !=
                        null
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () {
                            GetStorage().write('petId', null);
                            // Get.toNamed('/selectChatPage');
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: const Color.fromARGB(255, 214, 40, 40),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("กลับ"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: _friendsAcceptedController
                              .friendsAcceptedData.value.data!.length,
                          itemBuilder: (context, index) {
                            var result = _friendsAcceptedController
                                .friendsAcceptedData.value.data![index];
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
                                title: Text('${result.petName}'),
                                subtitle: Text('${result.species}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.message_outlined),
                                      color: Colors.pink,
                                      onPressed: () {
                                        GetStorage()
                                            .write('friendId', result.userId);
                                        Get.toNamed('/messages');
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )),
          ),
        ));
  }
}
