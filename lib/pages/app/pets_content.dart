import 'package:flutter/material.dart';

class PetsContent extends StatefulWidget {
  PetsContent({Key? key}) : super(key: key);

  @override
  State<PetsContent> createState() => _PetsContentState();
}

class _PetsContentState extends State<PetsContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PET"),
      ),
    );
  }
}
