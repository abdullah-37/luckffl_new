import 'package:get/get.dart';

import '../Controllers/update_nickname_screen_controller.dart';

class UpdateNicknameScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateNicknameScreenController>(
      () => UpdateNicknameScreenController(),
    );
  }
}
