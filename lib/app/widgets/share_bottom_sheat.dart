import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class ShareBottomSheet extends StatefulWidget {
  const ShareBottomSheet({super.key});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      height: 522.h,
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
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.checkTextColor,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          Text('공유하고 티켓 받기', style: AppTextStyles.bodyTitleExtraLarge),
          SizedBox(height: 8.h),
          Text('지금 바로 공유하고, 티켓 보상도 챙기세요!', style: AppTextStyles.endDetailsText),
          SizedBox(height: 30.h),
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '친구에게 공유하면 ',
                    style: AppTextStyles.appDownloadButtonText.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                  TextSpan(
                    text: '2P ',
                    style: AppTextStyles.appDownloadButtonText.copyWith(
                      color: AppColors.suffixTextColor,
                    ),
                  ),
                  TextSpan(
                    text: '바로 지급! ',
                    style: AppTextStyles.appDownloadButtonText.copyWith(
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Container(
            height: 158,
            decoration: BoxDecoration(
              color: AppColors.scaffoldcolour,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(AppIcons.talkIcon),
                    SvgPicture.asset(AppIcons.lineIcon),
                    SvgPicture.asset(AppIcons.facebookIcon),
                  ],
                ),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(AppIcons.xIcon, height: 40),
                    Image.asset(AppIcons.telegramIcon, height: 48),
                    SvgPicture.asset(AppIcons.copyLinkIcon),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 25.h),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.checkTextColor,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '다른 사람에게 공유 시, 기본으로 2P가 적립됩니다. '
                  '1일 최대 3회까지 공유 가능하여 최대 6P까지 적립할 수 있어요.',
                  style: AppTextStyles.bodySubtitle,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.checkTextColor,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '단, 캠페인 유형이 다운로드 / 방문 / 사전예약일 경우에는 공유받은 '
                  '상대방이 페이지를 확인해야 티켓이 지급됩니다. (노출 캠페인은 페이지 확인 없이도 지급 가능)',
                  style: AppTextStyles.bodySubtitle,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                height: 4,
                width: 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.checkTextColor,
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  '🚫 동일인에게 반복 공유하거나, 본인에게 공유하는 등 부정 참여 시 포인트 지급이 제한될 수 있습니다.',
                  style: AppTextStyles.bodySubtitle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
