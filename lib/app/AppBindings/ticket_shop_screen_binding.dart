import 'package:get/get.dart';

import '../Controllers/ticket_shop_screen_controller.dart';

class TicketShopScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketShopScreenController>(() => TicketShopScreenController());
  }
}
