import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:luck_ffle/app/Controllers/upcoming_campaign_details_controller.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class UpcomingCampaignDetails
    extends GetView<UpcomingCampaignDetailsController> {
  const UpcomingCampaignDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithPoints(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.colaImage),
                Positioned(
                  top: 25,
                  left: 30,
                  child: SvgPicture.asset(
                    height: 26,
                    AppImages.favourite,
                    colorFilter: const ColorFilter.mode(
                      AppColors.colaFavourite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text('스타벅스 아이스아메리카노 Tall', style: AppTextStyles.bodyTitleMedium),
            SizedBox(height: 10.h),
            Text(
              '2일 04: 07: 13  후 오픈 예정',
              style: AppTextStyles.bodyTitleMedium,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('응모기간', style: AppTextStyles.detailsTitleText),
                      Text(
                        '25.04.21 10:00 ~ 2025.04.27 20:00',
                        style: AppTextStyles.detailsText,
                      ),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('결과발표', style: AppTextStyles.detailsTitleText),
                      Text(
                        '25.04.27 20:00 이후',
                        style: AppTextStyles.detailsText,
                      ),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('당첨인원', style: AppTextStyles.detailsTitleText),
                      Text('10명', style: AppTextStyles.detailsText),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('내 응모 수', style: AppTextStyles.detailsTitleText),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.favourite,
                            colorFilter: const ColorFilter.mode(
                              AppColors.colaFavourite,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '0회 / 전체 0회',
                                  style: AppTextStyles.detailsText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 170,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.phoneButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '공유하기',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 170,
                  child: FloatingActionButton(
                    backgroundColor: AppColors.phoneButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '응모하기',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
