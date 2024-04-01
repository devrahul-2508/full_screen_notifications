import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_notification/controller/awesome_notification_controller.dart';
import 'package:full_screen_notification/splash/splash_page.dart';
import 'package:get/get.dart';
import 'bindings/app_bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod:
            AwesomeNotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            AwesomeNotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            AwesomeNotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            AwesomeNotificationController.onDismissActionReceivedMethod);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: AppBindings(),
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashPage());
  }
}
