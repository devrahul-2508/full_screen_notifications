import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:full_screen_notification/controller/awesome_notification_controller.dart';
import 'package:full_screen_notification/home/home_page.dart';
import 'package:full_screen_notification/notification/notification_page.dart';
import 'package:full_screen_notification/profile/profile_page.dart';
import 'package:full_screen_notification/settings/settings_page.dart';
import 'package:get/get.dart';

import '../utils/routes.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  @override
  void onReady() {
    super.onReady();

    // Check if Get.arguments is not null and if it contains the "route" key
  }

  // startNavigation() {
  //   log("Start nav called");
  //   if (Get.arguments != null && Get.arguments["route"] != null) {
  //     Future.delayed(const Duration(seconds: 2), () {
  //       navigate(Get.arguments["route"]);
  //     });
  //   }
  // }

  navigate(String route) {
    switch (route) {
      case homeRoute:
        Get.to(() => const HomePage());
        break;
      case profileRoute:
        Get.off(() => const ProfilePage());
        break;
      case settingsRoute:
        Get.off(() => const SettingsPage());
        break;
      case notificationRoute:
        Get.offUntil(
            MaterialPageRoute(builder: (_) => const NotificationPage()),
            (route) => false);
      default:
    }
  }

  _navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!AwesomeNotificationController.isNotificationCalled) {
        Get.off(() => HomePage());
      }
    });
  }
}