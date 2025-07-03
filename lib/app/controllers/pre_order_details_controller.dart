import 'package:get/get.dart';

class PreOrderDetailsController extends GetxController {
  // TODO: Add controller logic
  var isExpanded = false.obs;
  var selectedValue = '1'.obs;
  var val = true.obs;

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  void setSelectedValue(String value) {
    selectedValue.value = value;
  }

  void setVal(bool value) {
    val.value = value;
  }
}
