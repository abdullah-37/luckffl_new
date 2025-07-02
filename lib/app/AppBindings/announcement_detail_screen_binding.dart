import 'package:get/get.dart';

import '../Controllers/announcement_detail_screen_controller.dart';

class AnnouncementDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnnouncementDetailScreenController>(
      () => AnnouncementDetailScreenController(),
    );
  }
}
