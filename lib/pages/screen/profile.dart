import 'package:app/controller/pet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var firstName = GetStorage().read("name");
  var lastName = GetStorage().read("lastname");
  var Pet = GetStorage().read("Pet");
  final PetController _petController = Get.put(PetController());
  var userId = GetStorage().read("userId");
  String? choosType, email, tel;

  @override
  void initState() {
    // TODO: implement initState
    _petController.myPetList(userId as int);
    super.initState();
  }

  String itemGender = 'Male';
  List<String> genderList = [
    'Male',
    'Female',
  ];

  String itemAge = '<1';
  List<String> ageList = [
    '<1',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(padding: const EdgeInsets.all(30.0), children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              height: 230,
              width: 500,
              child: Card(
                  color: Colors.red[100],
                  elevation: 3.0,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(
                      20,
                      0,
                      0,
                      20,
                    ),
                    height: 300,
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit_outlined),
                              color: Colors.blue,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return ListView(
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(30.0),
                                              child: Column(children: [
                                                const Text(
                                                  'เเก้ไขข้อมูลส่วนตัว',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      height: 5,
                                                      fontSize: 20),
                                                ),
                                                TextField(
                                                  onChanged: (value) =>
                                                      firstName = value.trim(),
                                                  decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'ชื่อ :',
                                                    labelStyle: const TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    helperText:
                                                        'กรุณากรอกชื่อของคุณ',
                                                  ),
                                                ),
                                                const SizedBox(height: 15.0),
                                                TextField(
                                                  onChanged: (value) =>
                                                      lastName = value.trim(),
                                                  decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'นามสกุล :',
                                                    labelStyle: const TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    helperText:
                                                        'กรุณากรอกนามสกุลของคุณ',
                                                  ),
                                                ),
                                                const SizedBox(height: 15.0),
                                                TextField(
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  onChanged: (value) =>
                                                      email = value.trim(),
                                                  decoration: InputDecoration(
                                                    prefixIcon: const Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'E-mail :',
                                                    labelStyle: const TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    helperText:
                                                        'กรุณากรอก Email ของคุณ',
                                                  ),
                                                ),
                                                const SizedBox(height: 15.0),
                                                const SizedBox(height: 20.0),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 120,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.green[500],
                                                        ),
                                                        child: const Text(
                                                          'บันทึก',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    SizedBox(
                                                      width: 120,
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          navigator!
                                                              .pop(context);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.red[500],
                                                        ),
                                                        child: const Text(
                                                          'ยกเลิก',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ])),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: Colors.grey[300],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'asset/images/logopet.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  width: 100,
                                  color: Colors.black54,
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  '$firstName  $lastName',
                                  style: const TextStyle(fontSize: 35),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            const Divider(color: Colors.black),
            const SizedBox(height: 10.0),
            const Row(
              children: [
                Text(
                  'สัตว์เลี้ยงของคุณ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SizedBox(
                height: 170.0,
                child: Obx(() {
                  return !_petController.isLoading.value &&
                          _petController.petData.value.data != null
                      ? ListView.builder(
                          itemCount: _petController.petData.value.data!.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var value = _petController.petData.value.data;
                            return Card(
                              child: ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: value![index].petImage == null
                                      ? Image.asset(
                                          'asset/images/logopet.jpg',
                                          fit: BoxFit.cover,
                                        )
                                      : Image.network(
                                          '${value[index].petImage}',
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                title: Text(
                                    '${value[index].name}  ${value[index].age}'),
                                subtitle: Text(
                                    '${value[index].species}  ${value[index].gender}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle),
                                      color: Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          _petController.delPet(
                                              value[index].petId as int);
                                          _petController
                                              .myPetList(userId as int);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : _petController.petData.value.data != null
                          ? Container()
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                })),
            SizedBox(
              height: 40,
              child: Card(
                color: Colors.blue[200],
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return ListView(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(children: [
                                    const Text(
                                      'เพิ่มสัตว์เลี้ยง',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 5,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Radio(
                                                  value: 'Cat',
                                                  groupValue: choosType,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      choosType = value!;
                                                      _petController
                                                          .setPetSpecies(
                                                              value.toString());
                                                      print(value);
                                                    });
                                                  }),
                                              const Text(
                                                'เเมว',
                                                style: TextStyle(
                                                    color: Colors.pink),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Radio(
                                                  value: 'Dog',
                                                  groupValue: choosType,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      choosType = value!;
                                                      _petController
                                                          .setPetSpecies(
                                                              value.toString());
                                                      print(value);
                                                    });
                                                  }),
                                              const Text(
                                                'สุนัข',
                                                style: TextStyle(
                                                    color: Colors.pink),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 15.0),
                                    TextField(
                                      onChanged: (value) =>
                                          _petController.setBreed(value),
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.pets,
                                          color: Colors.pink,
                                        ),
                                        labelText: 'สายพันธุ์ :',
                                        labelStyle: const TextStyle(
                                          color: Colors.pink,
                                          fontSize: 15,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.pink),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.pink),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        helperText:
                                            'กรุณากรอกสายพันธุ์ของสัตว์เลี้ยง',
                                      ),
                                    ),
                                    const SizedBox(height: 15.0),
                                    TextField(
                                      onChanged: (value) =>
                                          _petController.setPetName(value),
                                      decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.pets,
                                          color: Colors.pink,
                                        ),
                                        labelText: 'ชื่อสัตว์เลี้ยง :',
                                        labelStyle: const TextStyle(
                                          color: Colors.pink,
                                          fontSize: 15,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.pink),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.pink),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        helperText:
                                            'กรุณากรอกชื่อสัตว์เลี้ยงของคุณ',
                                      ),
                                    ),
                                    Container(
                                      width: 250.0,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        onChanged: (value) => _petController
                                            .setPetAge(int.parse(value)),
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.pets,
                                            color: Colors.pink,
                                          ),
                                          labelText: 'อายุ :',
                                          labelStyle: TextStyle(
                                            color: Colors.pink,
                                            fontSize: 15,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.pink),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.pink),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          helperText:
                                              'กรุณากรอกอายุสัตว์เลี้ยงของคุณ',
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      child: Card(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 'Male',
                                                      groupValue: itemGender,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          itemGender = value!;
                                                          _petController
                                                              .setPetGender(value
                                                                  .toString());
                                                          print(value);
                                                        });
                                                      }),
                                                  Text(
                                                    'Male',
                                                    style: TextStyle(
                                                        color: Colors.pink),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                children: [
                                                  Radio(
                                                      value: 'Female',
                                                      groupValue: itemGender,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          itemGender = value!;
                                                          _petController
                                                              .setPetGender(value
                                                                  .toString());
                                                          print(value);
                                                        });
                                                      }),
                                                  Text(
                                                    'Female',
                                                    style: TextStyle(
                                                        color: Colors.pink),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 150.0,
                                          child: Image.asset(
                                              'asset/images/logopet.jpg'),
                                        ),
                                        IconButton(
                                            onPressed:
                                                _petController.selectImage,
                                            icon: const Icon(
                                                Icons.add_photo_alternate)),
                                      ],
                                    ),
                                    const SizedBox(height: 30.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              print("CLICK");
                                              _petController
                                                  .createPet(userId as int);
                                              _petController
                                                  .myPetList(userId as int);
                                              navigator!.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green[500],
                                            ),
                                            child: const Text(
                                              'บันทึก',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              navigator!.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red[500],
                                            ),
                                            child: const Text(
                                              'ยกเลิก',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ])),
                            ],
                          );
                        });
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.add_outlined,
                      ),
                      SizedBox(width: 76.0),
                      Text(
                        'เพิ่มสัตว์เลี้ยงของคุณ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Card(
                color: Colors.red[200],
                child: InkWell(
                  onTap: () {
                    print("tapped");
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 5.0),
                      Icon(
                        Icons.exit_to_app,
                      ),
                      SizedBox(width: 99.0),
                      Text(
                        'ออกจากระบบ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }

  Widget _showModalBottomSheet() => DraggableScrollableSheet(
        expand: false,
        key: UniqueKey(),
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: .5,
        builder: (context, controller) => Column(
          children: [
            Container(
              height: 59,
              color: Colors.cyanAccent,
            ),
            Expanded(
              child: ListView(
                controller: controller,
                children: [
                  ...List.generate(
                    40,
                    (index) => Container(
                      height: 100,
                      color:
                          index.isEven ? Colors.deepOrange : Colors.deepPurple,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
