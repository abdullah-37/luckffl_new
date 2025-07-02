import 'package:get/get.dart';

import '../Controllers/login_with_phone_controller.dart';

class LoginWithPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithPhoneController>(() => LoginWithPhoneController());
  }
}
