import 'package:app/constant/constant.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class RegisterController extends GetxController {
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
  RxString imagePath = RxString('');
  RxString imageName = RxString('');
  RxString base64Image = RxString('');
  RxString fileName = RxString('');

  setUsername(String value) {
    username.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  setEmail(String value) {
    email.value = value;
  }

  setFirstName(String value) {
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

  selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    base64Image.value = base64Encode(await pickedImage.readAsBytes());
    fileName.value = pickedImage.path.split('/').last;
  }

  void registerUser() async {
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
          'age': petAge.value,
          'image': base64Image.value,
          'filename': fileName.value
        },
      );
      if (response.statusCode == 200) {
        print('Login Successful: ${response.data}');

        Get.toNamed('/');
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
