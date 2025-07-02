import 'package:get/get.dart';

import '../Controllers/upcoming_campaign_details_controller.dart';

class UpcomingCampaignDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpcomingCampaignDetailsController>(
      () => UpcomingCampaignDetailsController(),
    );
  }
}
