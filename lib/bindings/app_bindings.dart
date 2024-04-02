import 'package:get/get.dart';
import '../service/notification_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationService());
  }
}