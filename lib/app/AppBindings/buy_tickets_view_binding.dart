import 'package:get/get.dart';

import '../Controllers/buy_tickets_view_controller.dart';

class BuyTicketsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuyTicketsViewController>(() => BuyTicketsViewController());
  }
}
