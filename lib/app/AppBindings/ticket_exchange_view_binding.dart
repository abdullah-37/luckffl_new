import 'package:get/get.dart';

import '../Controllers/ticket_exchange_view_controller.dart';

class TicketExchangeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketExchangeViewController>(
      () => TicketExchangeViewController(),
    );
  }
}
