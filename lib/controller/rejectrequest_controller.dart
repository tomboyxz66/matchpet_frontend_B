import 'package:app/constant/constant.dart';
import 'package:app/model/rejectRequest_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RejectRequestController extends GetxController {
  var dio = Dio();
  var isLoading = false.obs;
  var rejectData = RejectRequestModel().obs;

  myRejectRequest(int matchId) async {
    try {
      isLoading.value = true;
      final response = await dio.post(
        "${MyDomain().api}/api/rejectRequest",
        data: {
          'match_id': matchId,
        },
      );
      if (response.statusCode == 200) {
        rejectData.value = RejectRequestModel.fromJson(response.data);
      } // Assuming you have a UserService to fetch the list of users
      isLoading.value = false;
    } catch (e) {
      // Handle error
    }
  }
}
