import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '마이페이지',
          style: AppTextStyles.bodytitleLarge.copyWith(fontSize: 30),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Constants.horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),

              // User Profile Section
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppPages.myInfoScreen);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                      Constants.defaultRadius,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text('홍길동', style: AppTextStyles.bodytitleLarge),
                        SizedBox(height: 8.h),
                        Text(
                          'qwe12@naver.com',
                          style: AppTextStyles.bodySubtitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Wallet Section
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Constants.defaultRadius),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AppImages.wallet, height: 30.h),
                        SizedBox(width: 8.w),
                        Text('럭플 지갑', style: AppTextStyles.bodyText),
                      ],
                    ),
                    SizedBox(height: 15.w),

                    // Tickets Section 1
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppPages.myTicketsView);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  '나의 티켓',
                                  style: AppTextStyles.bodytitlesmall,
                                ),
                                const Spacer(),
                                SvgPicture.asset(
                                  AppImages.favourite,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.orange,

                                    BlendMode.srcIn,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '1,234',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey.shade400,
                                  size: 30.sp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.w),

                    // Points Section 2
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppPages.myPointsView);
                      },
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  '나의 티켓',
                                  style: AppTextStyles.bodytitlesmall,
                                ),
                                const Spacer(),
                                Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFFFD700),

                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'P',
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  '1,234',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey.shade400,
                                  size: 30.sp,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              // Ad Section
              Container(
                width: double.infinity,
                height: 120.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(
                    '광고영역',
                    style: AppTextStyles.bodyText.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              // Menu Items
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Constants.defaultRadius),
                ),
                child: Column(
                  children: [
                    _buildMenuItem('티켓샵', () {
                      Get.toNamed(AppPages.ticketShopScreen);
                    }),
                    _buildMenuItem('나의 상품함', () {
                      Get.toNamed(AppPages.myProductBoxScreen);
                    }),
                    _buildMenuItem('공지사항', () {
                      Get.toNamed(AppPages.announcementScreen);
                    }),
                    _buildMenuItem('자주 묻는 질문', () {
                      Get.toNamed(AppPages.faqScreen);
                    }),
                    _buildMenuItem('설정', () {
                      Get.toNamed(AppPages.settingsScreen);
                    }),
                  ],
                ),
              ),

              SizedBox(height: 60.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, void Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20.h),
        child: Row(
          children: [
            Text(title, style: AppTextStyles.bodytitlesmall),
            const Spacer(),
            Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 30.sp),
          ],
        ),
      ),
    );
  }
}
