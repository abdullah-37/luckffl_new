import 'package:get/get.dart';

import '../Controllers/my_info_screen_controller.dart';

class MyInfoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyInfoScreenController>(() => MyInfoScreenController());
  }
}
