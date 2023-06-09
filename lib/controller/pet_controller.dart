import 'dart:convert';

import 'package:app/constant/constant.dart';
import 'package:app/model/pet_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PetController extends GetxController {
  // var dio = Dio();
  var isLoading = false.obs;
  var petData = PetModel().obs;
  final RxString petName = ''.obs;
  final RxString petSpecies = ''.obs;
  final RxString petBreed = ''.obs;
  final RxString petGender = ''.obs;
  final RxInt petAge = 0.obs;
  RxString base64Image = RxString('');
  RxString fileName = RxString('');
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

  myPetList(int userId) async {
    try {
      isLoading.value = true;
      final response = await dio.Dio().post(
        "${MyDomain().api}/api/pets",
        data: {
          'user_id': userId,
        },
      );
      if (response.statusCode == 200) {
        petData.value = PetModel.fromJson(response.data);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }

  selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;

    base64Image.value = base64Encode(await pickedImage.readAsBytes());
    fileName.value = pickedImage.path.split('/').last;
  }

  createPet(int userId) async {
    try {
      isLoading.value = true;
      final response = await dio.Dio().post(
        "${MyDomain().api}/api/createPet",
        data: {
          'name': petName.value,
          'species': petSpecies.value,
          'breed': petBreed.value,
          'gender': petGender.value,
          'age': petAge.value,
          'owner_id': userId,
          'image': base64Image.value,
          'filename': fileName.value
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }

  delPet(int petId) async {
    try {
      isLoading.value = true;
      final response = await dio.Dio().post(
        "${MyDomain().api}/api/deletePet",
        data: {
          'pet_id': petId,
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }
}
