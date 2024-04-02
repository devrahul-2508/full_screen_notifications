import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notfication_controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Notification Activity"),
            const SizedBox(height: 15,),
            Text(controller.payLoadMsg,style: const TextStyle(fontSize: 18),),
            const SizedBox(height: 15,),
            ElevatedButton(
                onPressed: () {
                  controller.navigateToProfile();
                },
                child: const Text("Profile Page")),
            ElevatedButton(
                onPressed: () {
                  controller.navigateToSettings();
                },
                child: const Text("Settings Page")),
          ],
        ),
      ),
    );
  }
}
