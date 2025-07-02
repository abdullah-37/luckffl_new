import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:luck_ffle/app/Controllers/app_023_controller.dart';

class App023Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App023Controller>(() => App023Controller());
  }
}
