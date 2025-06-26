import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var currentIndex = 0.obs;
  RxBool isLastStep = false.obs;
  RxBool isGuidingFinished = false.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}
