import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Screen 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/test');
          },
          child: Text('Go to Screen 5'),
        ),
      ),
    );
  }
}
