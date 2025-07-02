import 'package:get/get.dart';

import '../Controllers/end_non_apply_details_controller.dart';

class EndNonApplyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndNonApplyDetailsController>(
      () => EndNonApplyDetailsController(),
    );
  }
}
