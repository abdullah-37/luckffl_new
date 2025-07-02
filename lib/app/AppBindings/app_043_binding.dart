import 'package:get/get.dart';

import '../Controllers/app_043_controller.dart';

class App043Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App043Controller>(() => App043Controller());
  }
}
