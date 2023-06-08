import 'package:app/constant/constant.dart';
import 'package:app/model/pet_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class PetController extends GetxController {
  var dio = Dio();
  var isLoading = false.obs;
  var petData = PetModel().obs;

  myPetList(int userId) async {
    try {
      isLoading.value = true;
      final response = await dio.post(
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
}
