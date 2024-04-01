import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/notification_helper.dart';

class NotificationService extends GetxService {
  final _awesomeNotification = AwesomeNotifications();

  @override
  void onInit() async {
    super.onInit();
    await _initNotificationService();
  }

  Future<void> _initNotificationService() async {
    final awesomeNotificationChannel = NotificationChannel(
      channelKey: NotificationHelper.kOverSpeedAlertChannelKey,
      channelName: NotificationHelper.kOverSpeedAlertChannelName,
      channelDescription: 'Notification shown when rider drives at high speeds',
      playSound: false,
      criticalAlerts: true,
      enableVibration: false,
      onlyAlertOnce: true,
      importance: NotificationImportance.High,
      defaultPrivacy: NotificationPrivacy.Public,
      defaultColor: Colors.blue,
      ledColor: Colors.blue,
    );

    await _awesomeNotification.initialize(
      'resource://drawable/res_bg_service_small',
      [
        awesomeNotificationChannel,
      ],
    );
  }

  Future<void> showHighSpeedAlertNotification() async {
    if (await _awesomeNotification.requestPermissionToSendNotifications()) {
      await _highSpeedNotification();
    }
  }

  Future<void> dismissHighSpeedAlertNotification() async =>
      await _awesomeNotification
          .dismiss(NotificationHelper.kOverSpeedAlertNotificationId);

  Future<void> _highSpeedNotification() async {
    // if notification is already there, dismiss it. even if not there it doesn't cause any error
    await dismissHighSpeedAlertNotification();
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await _awesomeNotification.createNotification(
      content: NotificationContent(
        id: NotificationHelper.kOverSpeedAlertNotificationId,
        channelKey: NotificationHelper.kOverSpeedAlertChannelKey,
        title: 'High Speed Alert',
        body: 'You are over-speeding, slow down!!',
        wakeUpScreen: true,
        category: NotificationCategory.Call,
        locked: true,
        criticalAlert: true,
        autoDismissible: true,
        showWhen: true,
        fullScreenIntent: true,
        payload: {"message":"Hi displaying notifications"}
      ),
      schedule: NotificationInterval(
        interval: 10,
        timeZone: localTimeZone,
        preciseAlarm: true,
      ), // Schedule the notification to be shown after 10 seconds
    );
  }
}
