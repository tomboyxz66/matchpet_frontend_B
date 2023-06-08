import 'package:flutter/material.dart';

class TestContent extends StatefulWidget {
  TestContent({Key? key}) : super(key: key);

  @override
  State<TestContent> createState() => _TestContentState();
}

class _TestContentState extends State<TestContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text("TEST"),
    );
  }
}
