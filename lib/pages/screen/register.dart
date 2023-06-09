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

  var itemGender;

  final RegisterController _registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: (MyStyle().fontColor),
        title: const Text('Register'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(30.0),
        children: [
          SizedBox(
            width: 250.0,
            child: TextField(
              onChanged: (value) => _registerController.setFirstName(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'ชื่อ :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกชื่อของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: TextField(
              onChanged: (value) => _registerController.setLastName(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'นามสกุล :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกนามสกุลของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: TextField(
              onChanged: (value) => _registerController.setUsername(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'Username :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอก UserName ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: TextField(
              obscureText: true,
              onChanged: (value) => _registerController.setPassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'Password :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอก Password ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: TextField(
              onChanged: (value) => _registerController.setLocation(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'ที่อยู่ :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกที่อยู่ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => _registerController.setEmail(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'E-mail :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอก Email ของคุณ',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
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
                                _registerController
                                    .setPetSpecies(value.toString());
                                print(value);
                              });
                            }),
                        const Text(
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
                                _registerController
                                    .setPetSpecies(value.toString());
                                print(value);
                              });
                            }),
                        const Text(
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
          SizedBox(
            width: 250.0,
            child: TextField(
              onChanged: (value) => _registerController.setBreed(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'สายพันธุ์ :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกสายพันธุ์ของสัตว์เลี้ยง',
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: TextField(
              onChanged: (value) => _registerController.setPetName(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'ชื่อสัตว์เลี้ยง :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                helperText: 'กรุณากรอกชื่อสัตว์เลี้ยงของคุณ',
              ),
            ),
          ),
          SizedBox(
            width: 250.0,
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) =>
                  _registerController.setPetAge(int.parse(value)),
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.pets,
                  color: Colors.pink,
                ),
                labelText: 'อายุ :',
                labelStyle: const TextStyle(
                  color: Colors.pink,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
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
          //           _registerController.setPetAge(int.parse(itemAge)),
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
          SizedBox(
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
                                _registerController
                                    .setPetGender(value.toString());
                                print(value);
                              });
                            }),
                        const Text(
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
                                _registerController
                                    .setPetGender(value.toString());
                                print(value);
                              });
                            }),
                        const Text(
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
          //         // setState(_registerController.setPetGender(value!));
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
                  icon: const Icon(Icons.add_photo_alternate)),
              // Container(
              //   width: 150.0,
              //   child: Obx(
              //     () => _registerController.imagePath.value.isEmpty
              //         ? Image.asset('asset/images/logopet.jpg')
              //         : Image.file(
              //             File(_registerController.imagePath.value),
              //             height: 150,
              //           ),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 20.0),
          const SizedBox(height: 20.0),
          SizedBox(
            width: 250.0,
            child: ElevatedButton(
              onPressed: () => _registerController.registerUser(),
              child: const Text('สมัครสมาชิก'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 241, 190, 207),
                onPrimary: Colors.pink[900],
                side: const BorderSide(color: Colors.red, width: 0.7),
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
