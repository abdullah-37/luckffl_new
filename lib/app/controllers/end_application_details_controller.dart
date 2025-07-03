import 'package:get/get.dart';

class EndApplicationDetailsController extends GetxController {
  // TODO: Add controller logic
  bool isExpanded = false;

  void toggel() {
    isExpanded = !isExpanded;
    update();
  }
}
