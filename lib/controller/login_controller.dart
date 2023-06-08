import 'package:app/constant/constant.dart';
import 'package:app/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final RxString username = ''.obs;
  final RxString password = ''.obs;
  var dio = Dio();
  var userModel = UserModel().obs;

  setUsername(String value) {
    username.value = value;
  }

  setPassword(String value) {
    password.value = value;
  }

  login() async {
    // Perform login logic here
    print(MyDomain().api);
    try {
      final response = await dio.post(
        '${MyDomain().api}/api/login',
        data: {
          'username': username.value,
          'password': password.value,
        },
      );
      if (response.statusCode == 200) {
        userModel.value = UserModel.fromJson(response.data);
        print('Login Successful: ${response.data}');
        GetStorage().write("userId", userModel.value.data!.users!.userId);
        GetStorage().write("name", userModel.value.data!.users!.firstName);
        GetStorage().write("lastname", userModel.value.data!.users!.lastName);
        GetStorage().write("Pet", userModel.value.data!.pet!);
        print(userModel.value.data!.pet!);
        Get.toNamed('/home');
      }
      // Handle the response here, e.g., save token, navigate to next screen, etc.
    } catch (error) {
      // Handle any errors that occur during the login process
      print('Login Error: $error');
    }
  }
}
