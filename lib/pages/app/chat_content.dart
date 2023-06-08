import 'package:flutter/material.dart';

class ChatContent extends StatefulWidget {
  ChatContent({Key? key}) : super(key: key);

  @override
  State<ChatContent> createState() => _ChatContentState();
}

class _ChatContentState extends State<ChatContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Chat"),
    );
  }
}
