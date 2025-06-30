import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/todays%20lucky%20chance/roulette_lucky_chance_view.dart';
import 'package:luck_ffle/app/views/todays%20lucky%20chance/todays_lucky_chance_view.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class TodaysLuckyChanceWidget extends StatelessWidget {
  const TodaysLuckyChanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text('todays_lucky_chance'.tr, style: AppTextStyles.bodytitleLarge),
          SizedBox(height: 20.h),
          // row
          GestureDetector(
            onTap: () {
              Get.to(() => const TodaysLuckyChanceView());
            },
            child: Row(
              spacing: 10,
              children: [
                //image
                Image.asset(AppImages.leafhand, height: 70.h),
                // column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('오늘의 행운을 뽑아보세요!', style: AppTextStyles.bodytitlesmall),
                    Text(
                      '티켓픽으로 상품뽑기 도전!'.tr,
                      style: AppTextStyles.bodySubtitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),

          GestureDetector(
            onTap: () {
              Get.to(() => const RouletteLuckyChanceView());
            },
            child: Row(
              spacing: 10,
              children: [
                //image
                Image.asset(AppImages.colorwheel, height: 70.h),
                // column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '룰렛을 돌리고 티켓을 GET!',
                      style: AppTextStyles.bodytitlesmall,
                    ),
                    Text(
                      '오늘의 행운, 룰렛을 돌려보세요!',
                      style: AppTextStyles.bodySubtitle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
