import 'package:get/get.dart';

import '../Controllers/my_points_view_controller.dart';

class MyPointsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPointsViewController>(() => MyPointsViewController());
  }
}
