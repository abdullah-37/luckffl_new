import 'package:get/get.dart';

import '../Controllers/withdraw_screen_controller.dart';

class WithdrawScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WithdrawScreenController>(() => WithdrawScreenController());
  }
}
