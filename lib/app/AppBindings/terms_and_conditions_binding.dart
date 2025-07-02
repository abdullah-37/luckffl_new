import 'package:get/get.dart';

import '../Controllers/terms_and_conditions_controller.dart';

class TermsAndConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsAndConditionsController>(
      () => TermsAndConditionsController(),
    );
  }
}
