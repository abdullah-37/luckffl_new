import 'package:get/get.dart';

import '../Controllers/rewards_view_controller.dart';

class RewardsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RewardsViewController>(() => RewardsViewController());
  }
}
