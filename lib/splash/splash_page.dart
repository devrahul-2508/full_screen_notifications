import 'package:flutter/material.dart';
import 'package:full_screen_notification/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SplashController());
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.notification_important,
          size: 150,
        ),
      ),
    );
  }
}
