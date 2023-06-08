import 'package:app/controller/pet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SelectChatPage extends StatefulWidget {
  SelectChatPage({Key? key}) : super(key: key);

  @override
  State<SelectChatPage> createState() => _SelectChatPageState();
}

class _SelectChatPageState extends State<SelectChatPage> {
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
        body: Container(
          child: Obx(() => !_petController.isLoading.value &&
                  _petController.petData.value.data != null
              ? SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: _petController.petData.value.data!.length,
                    itemBuilder: (context, index) {
                      var result = _petController.petData.value.data![index];
                      return Card(
                        color: Colors.red[100],
                        elevation: 3.0,
                        child: ListTile(
                          leading: ClipOval(
                            child: Image.asset(
                              'asset/images/logopet.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text('${result.name}'),
                          subtitle: Text('${result.species}'),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.message_outlined),
                                color: Colors.pink,
                                onPressed: () {
                                  GetStorage().write('petId', result.petId);
                                  Get.toNamed('/chatscreens');
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
        ));
  }
}
