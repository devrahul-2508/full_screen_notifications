import 'dart:developer';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

import '../service/method_channel_service.dart';

class AwesomeNotificationController {
  /// Use this method to detect when a new notification or a schedule is created

  static String payLoadMsg = "";
  static bool isNotificationCalled = false;
  static bool isNotificationTapped = false;

  static final _methodChannelService = Get.find<MethodChannelService>();

  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here
    log("Notification created");
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    // Your code goes here

    var data = receivedNotification.payload;
    if (data != null) {
      log(data["message"]!);
      payLoadMsg = data["message"]!;
    }
    isNotificationCalled = true;
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    log("Notification dismissed");
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened

    _methodChannelService.navigateToAndroidRoute(payLoad: payLoadMsg);

    log("Notification tapped");
  }
}
