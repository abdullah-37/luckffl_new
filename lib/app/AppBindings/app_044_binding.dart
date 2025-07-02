import 'package:get/get.dart';

import '../Controllers/app_044_controller.dart';

class App044Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App044Controller>(() => App044Controller());
  }
}
