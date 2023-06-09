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
  // @override
  var choosType;
  final ImagePicker _imagePicker = ImagePicker();
  final RegisterController _controllerregis = Get.put(RegisterController());

  var itemGender;

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
              onChanged: (value) => _controllerregis.setFirsName(value),
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
              onChanged: (value) => _controllerregis.setLastName(value),
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
              onChanged: (value) => _controllerregis.setUsername(value),
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
              onChanged: (value) => _controllerregis.setPassword(value),
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
              onChanged: (value) => _controllerregis.setLocation(value),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'ที่อยู่ :',
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
                helperText: 'กรุณากรอกที่อยู่ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => _controllerregis.setEmail(value),
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
                                choosType = value!;
                                _controllerregis
                                    .setPetSpecies(value.toString());
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
                                choosType = value!;
                                _controllerregis
                                    .setPetSpecies(value.toString());
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
              onChanged: (value) => _controllerregis.setBreed(value),
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
              onChanged: (value) => _controllerregis.setPetName(value),
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
          Container(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  _controllerregis.setPetAge(int.parse(value)),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'อายุ :',
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
                helperText: 'กรุณากรอกอายุสัตว์เลี้ยงของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'อายุ  ',
          //       style: TextStyle(color: Colors.pink),
          //     ),
          //     DropdownButton(
          //       style: TextStyle(color: Colors.pink),
          //       value: itemAge,
          //       items: ageList
          //           .map((itemAge) =>
          //               DropdownMenuItem(value: itemAge, child: Text(itemAge)))
          //           .toList(),
          //       onChanged: ((value) {
          //         setState(
          //           _controllerregis.setPetAge(int.parse(itemAge)),
          //         );
          //         print(value);
          //       }),
          //     ),
          //     Text(
          //       'ปี',
          //       style: TextStyle(color: Colors.pink),
          //     ),
          //   ],
          // ),
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
                            value: 'Male',
                            groupValue: itemGender,
                            onChanged: (value) {
                              setState(() {
                                itemGender = value!;
                                _controllerregis.setPetGender(value.toString());
                                print(value);
                              });
                            }),
                        Text(
                          'Male',
                          style: TextStyle(color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Radio(
                            value: 'Female',
                            groupValue: itemGender,
                            onChanged: (value) {
                              setState(() {
                                itemGender = value!;
                                _controllerregis.setPetGender(value.toString());
                                print(value);
                              });
                            }),
                        Text(
                          'Female',
                          style: TextStyle(color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       'เพศ',
          //       style: TextStyle(color: Colors.pink),
          //     ),
          //     DropdownButton(yim
          //       style: TextStyle(color: Colors.pink),
          //       value: itemGender,
          //       items: genderList
          //           .map((itemGender) => DropdownMenuItem(
          //               value: itemGender, child: Text(itemGender)))
          //           .toList(),
          //       onChanged: ((value) {
          //         // setState(_controllerregis.setPetGender(value!));
          //         print(itemGender);
          //       }),
          //     ),
          //   ],
          // ),
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
          const SizedBox(height: 20.0),
          Container(
            width: 250.0,
            child: ElevatedButton(
              onPressed: () => _controllerregis.registerUser(),
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
