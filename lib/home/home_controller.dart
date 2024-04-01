import 'package:get/get.dart';

import '../service/notification_service.dart';

class HomeController extends GetxController {
  final _notificationService = Get.find<NotificationService>();

  Future<void> scheduleFullScreenNotificationAfterDelay() async {
    await _notificationService.showHighSpeedAlertNotification();
  }
}
