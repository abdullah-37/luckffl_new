import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/auth%20views/login_with_phone.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';

class LoginBottomsheet extends StatefulWidget {
  const LoginBottomsheet({super.key});

  @override
  State<LoginBottomsheet> createState() => _LoginBottomsheetState();
}

class _LoginBottomsheetState extends State<LoginBottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: 370.h,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),

      child: Column(
        children: [
          Center(
            child: Container(
              height: 5,
              width: 38,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.checkTextColor,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            width: 320.w,
            height: 28.h,
            child: Text(
              '다른 방법으로 로그인',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            height: 50.h,
            width: 320.w,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.textColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.appleIcon),
                Text(
                  '다른 방법으로 시작하기',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            height: 50.h,
            width: 320.w,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.whiteColor,
              border: const Border.fromBorderSide(
                BorderSide(width: 1, color: AppColors.borderColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.googleIcon, height: 22),

                Text(
                  '구글로 시작하기',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: AppColors.textColor,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Container(
            height: 50.h,
            width: 320.w,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.neverButtonColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AppIcons.neverIcon),

                Text(
                  '네이버로 시작하기',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: AppColors.whiteColor,
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          GestureDetector(
            onTap: () {
              Get.to(() => const PhoneScreen());
            },
            child: Container(
              height: 50.h,
              width: 320.w,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.sliderColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppIcons.phoneIcon),

                  Text(
                    '전화번호로 시작하기',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
