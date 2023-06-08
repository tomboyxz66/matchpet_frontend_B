import 'dart:async';

import 'package:app/controller/getmessage.dart';
import 'package:app/controller/sendmessage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Chatmessage extends StatefulWidget {
  const Chatmessage({super.key});

  @override
  State<Chatmessage> createState() => _ChatmessageState();
}

class _ChatmessageState extends State<Chatmessage> {
  final SendMessengsController _sendMessengsController =
      Get.put(SendMessengsController());
  final GetMessengsModelController _getMessengsController =
      Get.put(GetMessengsModelController());

  var userId = GetStorage().read('userId');
  // var receiverId = GetStorage().read('receiverId');

  ScrollController _scrollController = ScrollController();
  TextEditingController _textEditingController = TextEditingController();

  void initState() {
    _getMessengsController.getMsgAPI(18 as int, userId as int);
    super.initState();
  }

  void sendMessage(String message) {
    setState(() {
      _sendMessengsController.sendMsgAPI(userId, 18, message);

      _getMessengsController.getMsgAPI(18 as int, userId as int);
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    _textEditingController.clear(); // ลบข้อความที่พิมพ์หลังจากส่ง
    // _focusNode.unfocus(); // ซ่อนคีย์บอร์ด
    // เลื่อนไปยังข้อความล่าสุด
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      _getMessengsController.getMsgAPI(18 as int, userId as int);
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Messengs'),
        automaticallyImplyLeading: true,
      ),
      body: Obx(
        () => !_getMessengsController.load.value &&
                _getMessengsController.getMsgData.value.message != null
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _getMessengsController
                          .getMsgData.value.message!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final msg = _getMessengsController
                            .getMsgData.value.message![index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: msg != userId
                                ? Container(
                                    width: 0,
                                  )
                                : CircleAvatar(),
                            // title: Text(message.sender_id),
                            subtitle: Row(
                              mainAxisAlignment: msg != userId
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Card(
                                    color: msg != userId
                                        ? Colors.pink
                                        : Colors.blue,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        msg,
                                        style: (TextStyle(color: Colors.white)),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: 'Type a message...',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            String message = _textEditingController.text.trim();
                            if (message.isNotEmpty) {
                              // sendMessage(message);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
