import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class FirstComeChallengeWidget extends StatelessWidget {
  const FirstComeChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title

          // row
          Row(
            spacing: 10,
            children: [
              //image
              Image.asset(AppImages.challenge, height: 70.h),
              // column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('오늘의 행운을 뽑아보세요!', style: AppTextStyles.bodytitlesmall),
                  Text('티켓픽으로 상품뽑기 도전!', style: AppTextStyles.bodySubtitle),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
