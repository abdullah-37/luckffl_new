import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/views/bottom%20navigation/bottom_navigation.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class RunningOutofTicketDialogue extends StatelessWidget {
  const RunningOutofTicketDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController navController = Get.find<BottomNavController>();
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.w,
        padding: EdgeInsets.all(30.w),
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
            Text('티켓이 부족해요!', style: AppTextStyles.bodytitlesmall),

            Text(
              '티켓이 있어야 응모할 수 있어요.\n이벤트를 공유하고 티켓을 모아요!',
              style: AppTextStyles.bodySubtitle,
            ),
            SizedBox(height: 20.h),
            // Action buttons
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {},
                    title: '그만하기',
                    color: const Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      navController.currentIndex.value = 2;
                      Get.offAll(() => const MainScreen());
                    },
                    title: '한번 더',
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
