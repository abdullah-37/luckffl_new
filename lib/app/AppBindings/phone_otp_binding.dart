import 'package:get/get.dart';

import '../Controllers/phone_otp_controller.dart';

class PhoneOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneOtpController>(() => PhoneOtpController());
  }
}
