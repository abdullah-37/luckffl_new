import 'package:get/get.dart';

import '../Controllers/roulette_spin_screen_controller.dart';

class RouletteSpinScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouletteSpinScreenController>(
      () => RouletteSpinScreenController(),
    );
  }
}
