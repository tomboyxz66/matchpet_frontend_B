import 'package:app/constant/constant.dart';
import 'package:app/model/pet_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PetController extends GetxController {
  // var dio = Dio();
  var isLoading = false.obs;
  final ImagePicker _imagePicker = ImagePicker();
  var petData = PetModel().obs;

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

  uploadImage(int petId) async {
    final XFile? imageFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (imageFile != null) {
      try {
        isLoading.value = true;
        dio.FormData formData = dio.FormData.fromMap({
          'image': await dio.MultipartFile.fromFile(imageFile.path,
              filename: 'image.jpg'),
        });

        await dio.Dio().post('${MyDomain().api}/api/pets', data: {
          "pet_id": petId,
          "pet_image": formData,
        });

        isLoading.value = false;
      } catch (error) {
        isLoading.value = false;
        // จัดการข้อผิดพลาด
      }
    }
  }
  

}
