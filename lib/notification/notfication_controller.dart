
import 'package:full_screen_notification/utils/routes.dart';
import 'package:get/get.dart';

import '../controller/awesome_notification_controller.dart';
import '../splash/splash_controller.dart';
import '../splash/splash_page.dart';

class NotificationController extends GetxController {
  String payLoadMsg = "";
  bool isNotificationTapped = false;

  final splashController = Get.put(SplashController());

  @override
  void onInit() {
    super.onInit();
    payLoadMsg = AwesomeNotificationController.payLoadMsg;
    isNotificationTapped = AwesomeNotificationController.isNotificationTapped;
  }

  navigateToProfile() {
    var args = {"route": profileRoute};
    Get.to(() => SplashPage(), arguments: args);
  }

  navigateToSettings() {
    var args = {"route": settingsRoute};
    Get.to(() => SplashPage(), arguments: args);
  }
}
