import 'package:get/get.dart';

import '../Controllers/notifications_view_controller.dart';

class NotificationsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsViewController>(
      () => NotificationsViewController(),
    );
  }
}
