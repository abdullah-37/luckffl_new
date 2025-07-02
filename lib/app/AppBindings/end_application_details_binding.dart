import 'package:get/get.dart';

import '../Controllers/end_application_details_controller.dart';

class EndApplicationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndApplicationDetailsController>(
      () => EndApplicationDetailsController(),
    );
  }
}
