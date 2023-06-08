import 'package:app/controller/accept_requestcomtroller.dart';
import 'package:app/controller/getpet_controller.dart';
import 'package:app/controller/rejectrequest_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddMatch extends StatefulWidget {
  const AddMatch({super.key});

  @override
  State<AddMatch> createState() => _AddMatchState();
}

class _AddMatchState extends State<AddMatch> {
  final GetAddPetController _getAddPetController =
      Get.put(GetAddPetController());

  final AcceptRequestController _acceptRequestController =
      Get.put(AcceptRequestController());

  final RejectRequestController _rejectRequestController =
      Get.put(RejectRequestController());

  var userId = GetStorage().read('userId');
  var petId = GetStorage().read('petId');
  var petName = GetStorage().read('petName');
  var species = GetStorage().read('species');
  var genderPet = GetStorage().read('genderPet');

  @override
  void initState() {
    _getAddPetController.getAddPetList(userId as int);
    super.initState();
  }

  void deleteItem(int index) {
    setState(() {
      _getAddPetController.getAddPetData.value.data!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Matchpet'),
          automaticallyImplyLeading: false,
        ),
        body: Obx(() => !_getAddPetController.isLoading.value
            ? _getAddPetController.getAddPetData.value.data != null
                ? SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount:
                          _getAddPetController.getAddPetData.value.data!.length,
                      itemBuilder: (context, index) {
                        var value =
                            _getAddPetController.getAddPetData.value.data;
                        return InkWell(
                          child: Card(
                            color: Colors.red[100],
                            elevation: 3.0,
                            child: ListTile(
                              leading: ClipOval(
                                child: Image.asset(
                                  'asset/images/logopet.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text('${value![index].pet1Name}'),
                              subtitle: Text('Card Subtitle'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.favorite),
                                    color: Colors.pink,
                                    onPressed: () {
                                      _acceptRequestController.myAcceptRequest(
                                          value[index].matchId as int);
                                      print(value[index].matchId);
                                      setState(() {
                                        _getAddPetController
                                            .getAddPetData.value.data!
                                            .removeAt(index);
                                      });
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.block),
                                    color: Colors.red,
                                    onPressed: () {
                                      _rejectRequestController.myRejectRequest(
                                          value[index].matchId as int);
                                      print(value[index].matchId);
                                      setState(() {
                                        _getAddPetController
                                            .getAddPetData.value.data!
                                            .removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
            : const Center(
                child: CircularProgressIndicator(),
              )));
  }
}
