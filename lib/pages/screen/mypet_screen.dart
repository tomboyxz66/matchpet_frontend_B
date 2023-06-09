import 'package:app/controller/pet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyPetScreen extends StatefulWidget {
  MyPetScreen({Key? key}) : super(key: key);

  @override
  State<MyPetScreen> createState() => _MyPetScreenState();
}

class _MyPetScreenState extends State<MyPetScreen> {
  final PetController _petController = Get.put(PetController());
  var userId = GetStorage().read("userId");

  @override
  void initState() {
    _petController.myPetList(userId as int);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mypet'),
        automaticallyImplyLeading: true,
      ),
      body: Obx(
        () => !_petController.isLoading.value &&
                _petController.petData.value.data != null
            ? Center(
                child: ListView.builder(
                  itemCount: _petController.petData.value.data!.length,
                  itemBuilder: (context, index) {
                    var value = _petController.petData.value.data;
                    return InkWell(
                      onTap: () {
                        GetStorage().write("species", value[index].species);
                        GetStorage().write("petName", value[index].name);
                        GetStorage().write("petId", value[index].petId);
                        GetStorage().write("genderPet", value[index].gender);
                        Get.toNamed("/matching");
                      },
                      child: Card(
                          color: Colors.red[100],
                          elevation: 3.0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            height: 200,
                            width: 300,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Colors.grey[300],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          child: Image.network(
                                            '${value![index].petImage}',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(top: 8),
                                          width: 150,
                                          color: Colors.black54,
                                          height: 2,
                                        ),
                                        const SizedBox(height: 4),
                                        Text('NAME : ${value![index].name}'),
                                        Text('AGE : ${value[index].age}'),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Column(
                                    //   crossAxisAlignment:
                                    //       CrossAxisAlignment.start,
                                    //   children: [
                                    //     Text(
                                    //       'John Doe',
                                    //       style: TextStyle(
                                    //         fontSize: 16,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //     ),
                                    //     SizedBox(height: 4),
                                    //     Text('JohnDee'),
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          value[index].gender!.toUpperCase() ==
                                                  "MALE"
                                              ? 'asset/images/male.png'
                                              : 'asset/images/female.png',
                                          height: 20,
                                          width: 20,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                            value[index].gender!.toUpperCase()),
                                      ],
                                    ),
                                    const SizedBox(width: 32),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${value[index].species}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text('${value[index].species}'),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
