import 'package:app/constant/constant.dart';
import 'package:app/model/get_messengs_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class GetMessengsModelController extends GetxController {
  var dio = Dio();
  var getMsgData = GetMessengsModel().obs;
  var load = false.obs;

  getMsgAPI(int sender_id, int receiver_id) async {
    load.value = true;
    try {
      var response = await dio.post('${MyDomain().api}/api/getMessage', data: {
        "sender_id": sender_id,
        "receiver_id": receiver_id,
      });
      if (response.statusCode == 200) {
        getMsgData.value = GetMessengsModel.fromJson(response.data);
        print(getMsgData.value.message);
      }
      print(response.statusCode);
      load.value = false;
    } catch (e) {
      print(e);
    }
  }
}
