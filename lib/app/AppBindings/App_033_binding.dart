import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/app_033_controller.dart';

class App033Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<App033Controller>(() => App033Controller());
  }
}
