import 'package:get/get.dart';

import '../Controllers/contact_us_msg_screen_controller.dart';

class ContactUsMsgScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsMsgScreenController>(
      () => ContactUsMsgScreenController(),
    );
  }
}
