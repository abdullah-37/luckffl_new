import 'package:get/state_manager.dart';

class EndLuckyApplicationDetailsController extends GetxController {
  bool isExpanded = false;

  toggleExpanded() {
    isExpanded = !isExpanded;
  }
}
