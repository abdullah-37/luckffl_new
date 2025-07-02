import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App28 extends StatelessWidget {
  const App28({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: CustomElevatedButton(
                onTap: () {
                  //(() => const App043());
                  Get.toNamed(AppPages.app043);
                },
                title: '후기 작성',
                color: const Color(0xFFfff6c9),
              ),
            ),
            Expanded(
              child: CustomElevatedButton(onTap: () {}, title: '후기 작성'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.close),
          ),
          const SizedBox(width: 10),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            SizedBox(height: 60.h),
            //
            Text(
              textAlign: TextAlign.center,
              '축하해요!\n신세계 상품권 100,000원권을\n뽑았어요!',
              style: AppTextStyles.bodytitleLarge,
            ),
            // confetti
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(AppImages.currency, width: 40),

                  Image.asset(AppImages.confetti),
                ],
              ),
            ),
            //
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '• 1~3영업일내에 상품이 지급돼요.\n• 마이페이지 > 내 상품함을 확인해주세요.',
                style: AppTextStyles.bodySubtitle,
              ),
            ),

            //
            // Row(
            //   children: [
            //     Expanded(
            //       child: CustomElevatedButton(onTap: () {}, title: '후기 작성'),
            //     ),
            //     Expanded(
            //       child: CustomElevatedButton(onTap: () {}, title: '후기 작성'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
