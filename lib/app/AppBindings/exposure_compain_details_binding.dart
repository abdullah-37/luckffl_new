import 'package:get/get.dart';

import '../Controllers/exposure_compain_details_controller.dart';

class ExposureCompainDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExposureCompainDetailsController>(
      () => ExposureCompainDetailsController(),
    );
  }
}
