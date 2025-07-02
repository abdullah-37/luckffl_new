import 'package:get/get.dart';

import '../Controllers/term_use_screen_controller.dart';

class TermUseScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermUseScreenController>(() => TermUseScreenController());
  }
}
