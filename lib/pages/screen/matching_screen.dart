import 'package:app/controller/matching_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MatchingScreen extends StatefulWidget {
  const MatchingScreen({super.key});

  @override
  State<MatchingScreen> createState() => _MatchingScreenState();
}

class _MatchingScreenState extends State<MatchingScreen> {
  final MatchingController _matchingController = Get.put(MatchingController());
  var userId = GetStorage().read('userId');
  var petId = GetStorage().read('petId');
  var petName = GetStorage().read('petName');
  var species = GetStorage().read('species');
  var genderPet = GetStorage().read('genderPet');
  @override
  void initState() {
    // TODO: implement initState
    _matchingController.getPetList(
        userId as int, species, petId as int, genderPet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matchpet  $petName'),
      ),
      body: Obx(() {
        return !_matchingController.isLoading.value &&
                _matchingController.petListData.value.data != null
            ? Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.grey[300],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                'asset/images/logopet.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text(
                                _matchingController
                                    .petListData
                                    .value
                                    .data![
                                        _matchingController.currentIndex.value]
                                    .name
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _matchingController.matchingPets(
                            userId,
                            petId,
                            _matchingController
                                .petListData
                                .value
                                .data![_matchingController.currentIndex.value]
                                .ownerId as int,
                            _matchingController
                                .petListData
                                .value
                                .data![_matchingController.currentIndex.value]
                                .petId as int,
                            '',
                          );
                          _matchingController.swipeLeft();
                        },
                        icon: const Icon(Icons.close),
                        iconSize: 48.0,
                        color: Colors.red,
                      ),
                      const SizedBox(width: 32.0),
                      IconButton(
                        onPressed: () {
                          _matchingController.matchingPets(
                              userId,
                              petId,
                              _matchingController
                                  .petListData
                                  .value
                                  .data![_matchingController.currentIndex.value]
                                  .ownerId as int,
                              _matchingController
                                  .petListData
                                  .value
                                  .data![_matchingController.currentIndex.value]
                                  .petId as int,
                              'Pending');
                          _matchingController.swipeRight();
                        },
                        icon: const Icon(Icons.favorite),
                        iconSize: 48.0,
                        color: Colors.pink,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
