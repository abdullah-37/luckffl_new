import 'package:get/get.dart';

import '../Controllers/my_product_box_screen_controller.dart';

class MyProductBoxScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductBoxScreenController>(
      () => MyProductBoxScreenController(),
    );
  }
}
