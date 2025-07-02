import 'package:get/get.dart';

import '../Controllers/lucky_board_controller.dart';

class LuckyBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LuckyBoardController>(() => LuckyBoardController());
  }
}
