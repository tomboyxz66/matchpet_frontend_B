import 'package:app/constant/constant.dart';
import 'package:app/model/getpet_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetAddPetController extends GetxController {
  var dio = Dio();
  var isLoading = false.obs;
  var getAddPetData = GetAddPetListModel().obs;

  getAddPetList(int userId) async {
    try {
      isLoading.value = true;
      final response = await dio.post(
        "${MyDomain().api}/api/getMatch",
        data: {
          'user_id': userId,
        },
      );
      print('dd Successful: ${response.data}');
      if (response.statusCode == 200) {
        getAddPetData.value = GetAddPetListModel.fromJson(response.data);
        print('Add Successful: ${response.data}');
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }
}
