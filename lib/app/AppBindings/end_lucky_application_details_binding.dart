import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/end_lucky_application_details_controller.dart.dart';

class EndLuckyApplicationDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EndLuckyApplicationDetailsController>(
      () => EndLuckyApplicationDetailsController(),
    );
  }
}
