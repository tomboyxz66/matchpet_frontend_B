import 'dart:io';

import 'package:app/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String username = "admins";
  String email = "admins88@example.com";
  String password = "admin";
  String name = "Tom5";
  String species = "Cat";
  String gender = "Female";
  int age = 5;
  // @override
  String? choosType, lastName, user, passWord, tel;
  final ImagePicker _imagePicker = ImagePicker();

  String itemDog = 'Pomeranian';
  List<String> dogList = [
    'Pomeranian',
    'Chihuahua',
    'Siberian Husky',
    'Alaskan Malamute',
    'Shiba Inu',
    'Welsh Corgi',
    'American Bully',
    'Yorkshire Terrier',
    'Schnauzer',
    'Dachshund',
    'French bulldog',
  ];

  String itemCat = 'Silver Blue';
  List<String> catList = [
    'Silver Blue',
    'Khao Manee',
    'Siamese',
    'Scottish Fold',
    'American Shorthair',
    'British Shorthair',
    'Exotic Shorthair',
    'Persian',
    'Ragdoll',
    'Sphinx',
    'Bengal',
  ];

  String itemAge = '<1';
  List<String> ageList = [
    '<1',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];

  String itemGender = 'Male';
  List<String> genderList = [
    'Male',
    'Female',
  ];
  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: (MyStyle().fontColor),
        title: Text('Register'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'ชื่อ :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกชื่อของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => lastName = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'นามสกุล :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกนามสกุลของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'Username :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอก UserName ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              obscureText: true,
              onChanged: (value) => passWord = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'Password :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอก Password ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) => tel = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'เบอร์โทร :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกเบอร์โทรศัพท์ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'E-mail :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอก Email ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 70,
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 'Cat',
                            groupValue: choosType,
                            onChanged: (value) {
                              setState(() {
                                choosType = value;
                                print(value);
                              });
                            }),
                        Text(
                          'เเมว',
                          style: TextStyle(color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 'Dog',
                            groupValue: choosType,
                            onChanged: (value) {
                              setState(() {
                                choosType = value;
                                print(value);
                              });
                            }),
                        Text(
                          'สุนัข',
                          style: TextStyle(color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => email = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'สายพันธุ์ :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกสายพันธุ์ของสัตว์เลี้ยง',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => user = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'ชื่อสัตว์เลี้ยง :',
                labelStyle: TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกชื่อสัตว์เลี้ยงของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'อายุ  ',
                style: TextStyle(color: Colors.pink),
              ),
              DropdownButton(
                style: TextStyle(color: Colors.pink),
                value: itemAge,
                items: ageList
                    .map((itemAge) =>
                        DropdownMenuItem(value: itemAge, child: Text(itemAge)))
                    .toList(),
                onChanged: ((value) {
                  setState(
                    () => itemAge = value.toString(),
                  );
                  print(itemAge);
                }),
              ),
              Text(
                'ปี',
                style: TextStyle(color: Colors.pink),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'เพศ',
                style: TextStyle(color: Colors.pink),
              ),
              DropdownButton(
                style: TextStyle(color: Colors.pink),
                value: itemGender,
                items: genderList
                    .map((itemGender) => DropdownMenuItem(
                        value: itemGender, child: Text(itemGender)))
                    .toList(),
                onChanged: ((value) {
                  setState(
                    () => itemGender = value.toString(),
                  );
                  print(itemGender);
                }),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Column(
            children: [
              IconButton(
                  onPressed: _registerController.selectImage,
                  icon: Icon(Icons.add_photo_alternate)),
              Container(
                width: 150.0,
                child: Obx(
                  () => _registerController.imagePath.value.isEmpty
                      ? Image.asset('asset/images/logopet.jpg')
                      : Image.file(
                          File(_registerController.imagePath.value),
                          height: 150,
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelStyle: TextStyle(color: Colors.pink),
                labelText: 'ข้อมูลเพิ่มเติม :',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              maxLines: 10,
            ),
          ),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('สมัครสมาชิก'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 241, 190, 207),
                onPrimary: Colors.pink[900],
                side: BorderSide(color: Colors.red, width: 0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
