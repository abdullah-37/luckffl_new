import 'package:get/get.dart';

import '../Controllers/visit_type_details_controller.dart';

class VisitTypeDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitTypeDetailsController>(() => VisitTypeDetailsController());
  }
}
