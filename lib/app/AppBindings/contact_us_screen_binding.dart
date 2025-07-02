import 'package:get/get.dart';

import '../Controllers/contact_us_screen_controller.dart';

class ContactUsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactUsScreenController>(() => ContactUsScreenController());
  }
}
