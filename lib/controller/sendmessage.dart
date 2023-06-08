import 'package:app/constant/constant.dart';
import 'package:app/model/send_messengs_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class SendMessengsController extends GetxController {
  var dio = Dio();
  var getSendMsgData = SendMessengsModel().obs;
  var load = false.obs;

  sendMsgAPI(int sender_id, int receiver_id, String message) async {
    load.value = true;
    try {
      var responsegetpet = await dio.post('${MyDomain().api}/api/sendMessage',
          data: {
            "sender_id": sender_id,
            "receiver_id": receiver_id,
            "message": message
          });
      if (responsegetpet.statusCode == 200) {
        getSendMsgData.value = SendMessengsModel.fromJson(responsegetpet.data);
        // print(getSendMsgData.value.data?.id ?? 'NO DATA');
      }
      print(responsegetpet.statusCode);
      load.value = false;
    } catch (e) {
      print(e);
    }
  }
}
