import 'package:app/controller/home_controller.dart';
import 'package:app/pages/screen/addmatch.dart';
import 'package:app/pages/screen/chat_list/chat_page.dart';
import 'package:app/pages/screen/chat_list/select_chat_page.dart';
import 'package:app/pages/screen/mypet_screen.dart';
import 'package:app/pages/screen/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _homeController = Get.put(HomeController());
  final List<IconData> icons = [
    Icons.local_fire_department_outlined,
    Icons.star_border,
    Icons.chat_outlined,
    Icons.person_2_outlined,
  ];

  final List<String> labels = [
    'Home',
    'Chat',
    'Profile',
    'Settings',
  ];

  final List<Color> colors = [
    Colors.pink,
    Colors.red,
    Colors.orange,
    Colors.purple,
  ];
  final List<Widget> screens = [
    MyPetScreen(),
    AddMatch(),
    SelectChatPage(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[_homeController.currentIndex.value]),
      bottomNavigationBar: Obx(() {
        int currentIndex = _homeController.currentIndex.value;

        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: currentIndex,
          onTap: (index) {
            _homeController.changePage(index);
          },
          items: List.generate(icons.length, (index) {
            return BottomNavigationBarItem(
              icon: Icon(
                icons[index],
                color: currentIndex == index ? colors[index] : Colors.grey,
              ),
              label: labels[index],
            );
          }),
        );
      }),
    );
  }
}
