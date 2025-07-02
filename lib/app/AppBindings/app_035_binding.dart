import 'package:get/get.dart';

import '../Controllers/app_035_controller.dart';

class App035Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App035Controller>(() => App035Controller());
  }
}
