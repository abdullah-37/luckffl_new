import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/config/app_colors.dart';

class AppTextStyles {
  static TextStyle get bodyTitleExtraLarge => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle get bodytitleLarge => TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle get bodyTitleMedium => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textColor,
  );

  static TextStyle get detailsLargeTitle => TextStyle(
    fontSize: 20.sp,
    color: AppColors.textColor,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get bodytitlesmall => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle get dialogueTitleText => TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle get appDownloadButtonText => TextStyle(
    fontSize: 16.sp,
    color: AppColors.scaffoldcolour,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get detailsSubTitle => TextStyle(
    fontSize: 16.sp,
    color: AppColors.checkTextColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get buttonText => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );

  static TextStyle get conditionText => TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textColor,
  );

  static TextStyle get bodySubtitle =>
      TextStyle(fontSize: 14.sp, color: Colors.grey.shade600, height: 1.4);

  static TextStyle get bodyText =>
      TextStyle(fontSize: 14.sp, color: Colors.black, height: 1.4);

  static TextStyle get dialogueText => TextStyle(
    fontSize: 14.sp,
    color: AppColors.dialogueText,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get detailsText => TextStyle(
    fontSize: 14.sp,
    color: AppColors.checkTextColor,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get detailsTitleText => TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get bodyTextSmall =>
      TextStyle(fontSize: 12.sp, color: AppColors.textColor, height: 1.4);

  static TextStyle get checkText =>
      TextStyle(fontSize: 12.sp, color: AppColors.checkTextColor, height: 1.4);

  static TextStyle get detailContainerText => TextStyle(
    fontSize: 12.sp,
    color: AppColors.checkTextColor,
    fontWeight: FontWeight.w600,
  );

  static TextStyle get selectedTabText => TextStyle(
    fontSize: 12.sp,
    color: AppColors.selectedTabColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get unSelectedTabText => TextStyle(
    fontSize: 12.sp,
    color: AppColors.unselectedTabColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get endDetailsText => TextStyle(
    fontSize: 14.sp,
    color: AppColors.textColor,
    fontWeight: FontWeight.w500,
  );

  static TextStyle get underLineText => TextStyle(
    fontSize: 12.sp,
    color: AppColors.checkTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.underline,
    decorationColor: AppColors.checkTextColor,
  );
}
