import 'package:get/get.dart';

import '../Controllers/app_38_controller.dart';

class App38Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App38Controller>(() => App38Controller());
  }
}
