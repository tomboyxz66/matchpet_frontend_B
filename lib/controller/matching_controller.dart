import 'package:app/constant/constant.dart';
import 'package:app/model/pet_list_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MatchingController extends GetxController {
  var dio = Dio();
  var isLoading = false.obs;
  var petListData = PetListModel().obs;
  var currentIndex = 0.obs;

  getPetList(int ownerId, String species, int pet_id, String genderPet) async {
    // Simulating API call delay with Future.delayed
    await Future.delayed(const Duration(seconds: 2));
    try {
      isLoading.value = true;
      final response = await dio.post(
        "${MyDomain().api}/api/getAllPets",
        data: {
          'owner_id': ownerId,
          'species': species,
          'pet_id': pet_id,
          'gender': genderPet,
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        petListData.value = PetListModel.fromJson(response.data);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }

  matchingPets(
    int myId,
    int myPet,
    int ownerId,
    int pet,
    String checked,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      isLoading.value = true;
      final response = await dio.post(
        "${MyDomain().api}/api/createMatch",
        data: {
          "user1_id": myId,
          "user2_id": ownerId,
          "pet1_id": myPet,
          "pet2_id": pet,
          "match_status": checked
        },
      );
      if (response.statusCode == 200) {
        print(response.data);
        // getPetList(myId, "Dog", petName);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }

  swipeLeft() async {
    currentIndex.value =
        (currentIndex.value + 1) % petListData.value.data!.length;
  }

  swipeRight() async {
    currentIndex.value =
        (currentIndex.value + 1) % petListData.value.data!.length;
    // Add your logic for matching with the pet here
  }
}
