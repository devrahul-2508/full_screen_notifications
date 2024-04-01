import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              controller.scheduleFullScreenNotificationAfterDelay();
            },
            child: const Text("Schedule Notification")),
      ),
    );
  }
}
