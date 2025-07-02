import 'package:get/get.dart';

import '../Controllers/ticket_upgrade_view_controller.dart';

class TicketUpgradeViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketUpgradeViewController>(
      () => TicketUpgradeViewController(),
    );
  }
}
