import 'package:get/get.dart';

import '../Controllers/app_062_controller.dart';

class App062Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App062Controller>(() => App062Controller());
  }
}
