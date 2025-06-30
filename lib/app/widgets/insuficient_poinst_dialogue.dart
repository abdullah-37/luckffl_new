import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/views/bottom%20navigation/bottom_navigation.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class InsuficientPoinstDialogue extends StatelessWidget {
  const InsuficientPoinstDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController navController = Get.find<BottomNavController>();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            //image
            Image.asset(AppImages.sadface, height: 80.h),
            Text('포인트가 부족해요', style: AppTextStyles.bodytitlesmall),

            Text(
              '포인트를 모아 교환할 수 있어요.\n미션을 완료해 포인트를 모아요!',
              style: AppTextStyles.bodySubtitle,
            ),

            SizedBox(height: 20.h),
            // Action buttons
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      // Get.to(() => const RouletteLuckyChanceView());
                    },
                    title: '나중에',
                    color: const Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      Get.back();
                      navController.currentIndex.value = 2;
                      Get.offAll(() => const MainScreen());
                    },
                    title: '포인트모으기',
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
