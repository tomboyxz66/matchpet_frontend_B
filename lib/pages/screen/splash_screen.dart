import 'package:app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate some loading time
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const LoginPage());
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('asset/images/logopet.jpg'),
      ),
    );
  }
}
