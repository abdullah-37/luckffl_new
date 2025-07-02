import 'package:get/get.dart';

import '../Controllers/sliding_product_in_progress_controller.dart';

class SlidingProductInProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SlidingProductInProgressController>(
      () => SlidingProductInProgressController(),
    );
  }
}
