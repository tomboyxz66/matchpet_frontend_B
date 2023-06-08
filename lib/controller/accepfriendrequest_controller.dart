import 'package:app/constant/constant.dart';
import 'package:app/model/accepfriendrequest_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class FriendsAcceptedController extends GetxController {
  var dio = Dio();
  var isLoading = false.obs;
  var friendsAcceptedData = FriendsAcceptedModel().obs;

  myfriendsAccepted(int user_id) async {
    try {
      isLoading.value = true;
      final response = await dio.post(
        "${MyDomain().api}/api/getAcceptedFriends",
        data: {
          'user_id': user_id,
        },
      );
      if (response.statusCode == 200) {
        friendsAcceptedData.value =
            FriendsAcceptedModel.fromJson(response.data);
      }
      isLoading.value = false;
    } catch (e) {}
  }
}
