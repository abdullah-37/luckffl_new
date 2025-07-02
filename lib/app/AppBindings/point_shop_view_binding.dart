import 'package:get/get.dart';

import '../Controllers/point_shop_view_controller.dart';

class PointShopViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PointShopViewController>(() => PointShopViewController());
  }
}
