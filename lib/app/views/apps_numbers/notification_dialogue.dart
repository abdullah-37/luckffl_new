import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class NotificationDialogue extends StatelessWidget {
  const NotificationDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      height: 610.h,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 5,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.checkTextColor,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Image.asset(AppImages.bell, height: 80.h),
          SizedBox(height: 20.h),
          Text('출석을 놓치지 않게 알려드릴게요!', style: AppTextStyles.bodyTitleExtraLarge),
          SizedBox(height: 20.h),
          Text(
            '매일 출석하고 티켓, 포인트 혜택을 챙기세요.',
            style: AppTextStyles.detailsSubTitle.copyWith(
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            '중요한 이벤트 소식도 빠르게 받아볼 수 있어요!',
            style: AppTextStyles.detailsSubTitle.copyWith(
              color: AppColors.textColor,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '🗓️ 출석체크 알림 – 출석 놓치지 않기!',
            style: AppTextStyles.detailsText.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '🎯 미션/이벤트 시작 알림 – 새로운 기회를 가장 먼저!',
            style: AppTextStyles.detailsText.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '🎁 리워드 지급 알림 – 당첨 소식을 바로 받아보기!',
            style: AppTextStyles.detailsText.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 48.h,
              width: 327.w,
              decoration: BoxDecoration(
                color: AppColors.sliderColor,
                borderRadius: BorderRadius.circular(48),
              ),
              child: Center(
                child: Text(
                  '네, 좋아요',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    color: AppColors.textColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              '괜찮아요',
              style: AppTextStyles.appDownloadButtonText.copyWith(
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
