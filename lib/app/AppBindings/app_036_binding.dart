import 'package:get/get.dart';

import '../Controllers/app_036_controller.dart';

class App036Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App036Controller>(() => App036Controller());
  }
}
