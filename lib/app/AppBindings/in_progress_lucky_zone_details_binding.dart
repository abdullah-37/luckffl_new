import 'package:get/get.dart';

import '../Controllers/in_progress_lucky_zone_details_controller.dart';

class InProgressLuckyZoneDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InProgressLuckyZoneDetailsController>(
      () => InProgressLuckyZoneDetailsController(),
    );
  }
}
