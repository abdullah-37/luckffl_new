import 'package:get/get.dart';

import '../Controllers/sliding_product_end_status_controller.dart';

class SlidingProductEndStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlidingProductEndStatusController>(
      () => SlidingProductEndStatusController(),
    );
  }
}
