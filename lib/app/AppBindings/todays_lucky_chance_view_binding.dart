import 'package:get/get.dart';

import '../Controllers/todays_lucky_chance_view_controller.dart';

class TodaysLuckyChanceViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodaysLuckyChanceViewController>(
      () => TodaysLuckyChanceViewController(),
    );
  }
}
