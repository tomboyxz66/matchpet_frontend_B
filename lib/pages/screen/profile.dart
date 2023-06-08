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
  String? choosType, email, tel;

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
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(padding: EdgeInsets.all(30.0), children: [
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
                              icon: Icon(Icons.edit_outlined),
                              color: Colors.blue,
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return ListView(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(30.0),
                                              child: Column(children: [
                                                Text(
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
                                                    prefixIcon: Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'ชื่อ :',
                                                    labelStyle: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
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
                                                    prefixIcon: Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'นามสกุล :',
                                                    labelStyle: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
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
                                                  keyboardType:
                                                      TextInputType.phone,
                                                  onChanged: (value) =>
                                                      tel = value.trim(),
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'เบอร์โทร :',
                                                    labelStyle: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    helperText:
                                                        'กรุณากรอกเบอร์โทรศัพท์ของคุณ',
                                                  ),
                                                ),
                                                const SizedBox(height: 15.0),
                                                TextField(
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  onChanged: (value) =>
                                                      email = value.trim(),
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.pets,
                                                      color: Colors.pink,
                                                    ),
                                                    labelText: 'E-mail :',
                                                    labelStyle: TextStyle(
                                                      color: Colors.pink,
                                                      fontSize: 15,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.pink),
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
                                                        child: const Text(
                                                          'บันทึก',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.green[500],
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    SizedBox(
                                                      width: 120,
                                                      child: ElevatedButton(
                                                        child: const Text(
                                                          'ยกเลิก',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          navigator!
                                                              .pop(context);
                                                        },
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          primary:
                                                              Colors.red[500],
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
                                  style: TextStyle(fontSize: 35),
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
            Divider(color: Colors.black),
            const SizedBox(height: 10.0),
            Row(
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
              child: ListView.builder(
                itemCount: Pet.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Image.asset(
                          'asset/images/logopet.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text('${Pet![index].name}  ${Pet![index].age}'),
                      subtitle:
                          Text('${Pet![index].species}  ${Pet![index].gender}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            color: Colors.red,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
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
                                  padding: EdgeInsets.all(30.0),
                                  child: Column(children: [
                                    Text(
                                      'เพิ่มสัตว์เลี้ยง',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          height: 5,
                                          fontSize: 20),
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
                                                      value: 'Cat',
                                                      groupValue: choosType,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          choosType = value;
                                                          print(value);
                                                        });
                                                      }),
                                                  Text(
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
                                                          choosType = value;
                                                          print(value);
                                                        });
                                                      }),
                                                  Text(
                                                    'สุนัข',
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
                                    const SizedBox(height: 15.0),
                                    TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.pets,
                                          color: Colors.pink,
                                        ),
                                        labelText: 'สายพันธุ์ :',
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
                                            'กรุณากรอกสายพันธุ์ของสัตว์เลี้ยง',
                                      ),
                                    ),
                                    const SizedBox(height: 15.0),
                                    TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.pets,
                                          color: Colors.pink,
                                        ),
                                        labelText: 'ชื่อสัตว์เลี้ยง :',
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
                                            'กรุณากรอกชื่อสัตว์เลี้ยงของคุณ',
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'อายุ  ',
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.pink),
                                          value: itemAge,
                                          items: ageList
                                              .map((itemAge) =>
                                                  DropdownMenuItem(
                                                      value: itemAge,
                                                      child: Text(itemAge)))
                                              .toList(),
                                          onChanged: ((value) {
                                            setState(
                                              () => itemAge = value.toString(),
                                            );
                                            print(itemAge);
                                          }),
                                        ),
                                        Text(
                                          'ปี',
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'เพศ',
                                          style: TextStyle(color: Colors.pink),
                                        ),
                                        DropdownButton(
                                          style: TextStyle(color: Colors.pink),
                                          value: itemGender,
                                          items: genderList
                                              .map((itemGender) =>
                                                  DropdownMenuItem(
                                                      value: itemGender,
                                                      child: Text(itemGender)))
                                              .toList(),
                                          onChanged: ((value) {
                                            setState(
                                              () =>
                                                  itemGender = value.toString(),
                                            );
                                            print(itemGender);
                                          }),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 150.0,
                                          child: Image.asset(
                                              'asset/images/logopet.jpg'),
                                        ),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(
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
                                            child: const Text(
                                              'บันทึก',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green[500],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10.0),
                                        SizedBox(
                                          width: 120,
                                          child: ElevatedButton(
                                            child: const Text(
                                              'ยกเลิก',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () {
                                              navigator!.pop(context);
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red[500],
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5.0),
                      Icon(
                        Icons.add_outlined,
                      ),
                      const SizedBox(width: 76.0),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 5.0),
                      Icon(
                        Icons.exit_to_app,
                      ),
                      const SizedBox(width: 99.0),
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
