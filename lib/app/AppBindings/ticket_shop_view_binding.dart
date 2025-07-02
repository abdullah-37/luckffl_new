import 'package:get/get.dart';

import '../Controllers/ticket_shop_view_controller.dart';

class TicketShopViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketShopViewController>(() => TicketShopViewController());
  }
}
