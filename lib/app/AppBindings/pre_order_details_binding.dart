import 'package:get/get.dart';

import '../Controllers/pre_order_details_controller.dart';

class PreOrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreOrderDetailsController>(() => PreOrderDetailsController());
  }
}
