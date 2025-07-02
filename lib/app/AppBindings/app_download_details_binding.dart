import 'package:get/get.dart';

import '../Controllers/app_download_details_controller.dart';

class AppDownloadDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppDownloadDetailsController>(
      () => AppDownloadDetailsController(),
    );
  }
}
