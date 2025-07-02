import 'package:get/get.dart';

import '../Controllers/faq_screen_controller.dart';

class FAQScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FAQScreenController>(() => FAQScreenController());
  }
}
