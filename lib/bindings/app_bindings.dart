import 'package:full_screen_notification/service/notification_service.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationService());
  }
}