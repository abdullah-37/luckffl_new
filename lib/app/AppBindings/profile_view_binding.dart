import 'package:get/get.dart';

import '../Controllers/profile_view_controller.dart';

class ProfileViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileViewController>(() => ProfileViewController());
  }
}
