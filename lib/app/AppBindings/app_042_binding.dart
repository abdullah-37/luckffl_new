import 'package:get/get.dart';

import '../Controllers/app_042_controller.dart';

class App042Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App042Controller>(() => App042Controller());
  }
}
