import 'package:app/pages/app/pets_content.dart';
import 'package:app/pages/app/test_content.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_page.dart';
import 'package:app/pages/screen/chat_list/chat_page.dart';
import 'package:app/pages/screen/matching_screen.dart';
import 'package:app/pages/screen/register.dart';
import 'package:get/get.dart';

import '../pages/screen/chat_list/chatmessage .dart';

appRoutes() => [
      GetPage(
        name: '/home',
        page: () => const HomePage(),
        children: [],
      ),
      GetPage(
        name: '/register',
        page: () => const Register(),
        children: [],
      ),
      GetPage(
        name: '/messages',
        page: () => const Chatmessage(),
        children: [],
      ),
      GetPage(
        name: '/matching',
        page: () => const MatchingScreen(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/chatscreens',
        page: () => ChatScreens(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/pet',
        page: () => PetsContent(),
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/login',
        page: () => const LoginPage(),
        // transition: Transition.leftToRightWithFade,
        // transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: '/test',
        page: () => TestContent(),
      ),
    ];
