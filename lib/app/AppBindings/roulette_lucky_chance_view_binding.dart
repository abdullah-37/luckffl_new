import 'package:get/get.dart';

import '../Controllers/roulette_lucky_chance_view_controller.dart';

class RouletteLuckyChanceViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RouletteLuckyChanceViewController>(
      () => RouletteLuckyChanceViewController(),
    );
  }
}
