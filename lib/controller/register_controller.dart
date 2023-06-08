import 'package:app/constant/constant.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get_storage/get_storage.dart';

class RegisterController extends GetxController {
  final ImagePicker _imagePicker = ImagePicker();

  final RxString username = ''.obs;
  final RxString password = ''.obs;
  final RxString email = ''.obs;
  final RxString firstName = ''.obs;
  final RxString lastName = ''.obs;
  final RxString location = ''.obs;
  final RxString petName = ''.obs;
  final RxString petSpecies = ''.obs;
  final RxString petBreed = ''.obs;
  final RxString petGender = ''.obs;
  final RxInt petAge = 0.obs;

  setUsername(String value) {
    username.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  setEmail(String value) {
    email.value = value;
  }

  setFirsName(String value) {
    firstName.value = value;
  }

  setLastName(String value) {
    lastName.value = value;
  }

  setLocation(String value) {
    location.value = value;
  }

  setPetName(String value) {
    petName.value = value;
  }

  setPetSpecies(String value) {
    petSpecies.value = value;
  }

  setBreed(String value) {
    petBreed.value = value;
  }

  setPetGender(String value) {
    petGender.value = value;
  }

  setPetAge(int value) {
    petAge.value = value;
  }

  RxString imagePath = RxString('');

  void selectImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      imagePath.value = pickedFile.path;
      update();
    }
  }

  void registerUser() async {
    if (username.value.isEmpty ||
        email.value.isEmpty ||
        firstName.value.isEmpty ||
        lastName.value.isEmpty ||
        password.value.isEmpty ||
        location.value.isEmpty ||
        petName.value.isEmpty ||
        petSpecies.value.isEmpty ||
        petGender.value.isEmpty ||
        petBreed.value.isEmpty ||
        imagePath.value.isEmpty) {
      Get.snackbar('Error', 'Please fill in all fields');
      return;
    }
    try {
      final response = await dio.Dio().post(
        '${MyDomain().api}/api/register',
        data: {
          'username': username.value,
          'email': email.value,
          'first_name': firstName.value,
          'last_name': lastName.value,
          'password': password.value,
          'location': location.value,
          'name': petName.value,
          'species': petSpecies.value,
          'breed': petBreed.value,
          'gender': petGender.value,
          'age': petAge,
          'image': await dio.MultipartFile.fromFile(imagePath.value),
        },
      );
      if (response.statusCode == 200) {
        print('Login Successful: ${response.data}');

        Get.toNamed('/login');
      }
      // Handle the response here, e.g., save token, navigate to next screen, etc.
    } catch (error) {
      // Handle any errors that occur during the login process
      print('Login Error: $error');
    }

    // if (response['status'] == 'success') {
    //   // Registration successful
    //   Get.snackbar('Success', 'Registration successful');
    // } else {
    //   // Error occurred
    //   Get.snackbar('Error', 'An error occurred');
    // }
  }
}
