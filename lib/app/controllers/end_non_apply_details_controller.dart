import 'package:get/get.dart';

class EndNonApplyDetailsController extends GetxController {
  bool isExpanded = false;

  void toggel() {
    isExpanded = !isExpanded;
    update();
  }

  // TODO: Add controller logic
}
