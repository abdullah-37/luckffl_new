import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/my_tickets_view_controller.dart';

class MyTicketsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTicketsViewController>(() => MyTicketsViewController());
  }
}
