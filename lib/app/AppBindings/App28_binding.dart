import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/app_028_controller.dart';

class App028Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App028Controller>(() => App028Controller());
  }
}
