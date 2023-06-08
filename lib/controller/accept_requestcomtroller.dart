import 'package:app/constant/constant.dart';
import 'package:app/model/accepRequest_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AcceptRequestController extends GetxController {
  var dio = Dio();
  var isLoading = false.obs;
  var acceptData = AcceptRequestModel().obs;

  myAcceptRequest(int matchId) async {
    try {
      isLoading.value = true;
      final response = await dio.post(
        "${MyDomain().api}/api/acceptRequest",
        data: {
          'match_id': matchId,
        },
      );
      if (response.statusCode == 200) {
        acceptData.value = AcceptRequestModel.fromJson(response.data);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }
}
