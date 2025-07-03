import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:luck_ffle/app/Controllers/ticket_exchange_view_controller.dart';
import 'package:luck_ffle/app/widgets/ticket_exchange_dialogue.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class TicketExchangeView extends GetView<TicketExchangeViewController> {
  const TicketExchangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('나의 포인트', style: AppTextStyles.bodytitlesmall),
        centerTitle: true,
      ),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            // Header section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '티켓을 구매하고',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '더 많은 이벤트에 응모해보세요!',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFfafafa),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    children: [
                      _buildBulletPoint('티켓은 이벤트 응모에 사용됩니다.'),
                      const SizedBox(height: 8),
                      _buildBulletPoint('리워드룰이 높을수록 이벤트 참여 시 당첨의 확률이 증가합니다.'),
                      const SizedBox(height: 8),
                      _buildBulletPoint('구매 후 티켓은 즉시 계정에 지급됩니다.'),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 8.h),

            // Sort section

            // Divider

            // Package list
            Expanded(
              child: ListView(
                children: [
                  _buildPackageItem(
                    '브론즈 티켓으로 교환',
                    '100P',
                    const Color(0xFF86360c),
                    context,
                  ),
                  _buildPackageItem(
                    '실버 티켓으로 교환',
                    '1,000P',
                    const Color(0xFFc3c3c3),
                    context,
                  ),
                  _buildPackageItem(
                    '골드 티켓으로 교환',
                    '10,000P',
                    AppColors.primaryColor,
                    context,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 4,
          margin: const EdgeInsets.only(top: 8, right: 8),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.circle,
          ),
        ),
        Expanded(child: Text(text, style: AppTextStyles.bodySubtitle)),
      ],
    );
  }

  Widget _buildPackageItem(
    String title,
    String points,
    Color color,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => const BuyTicketScreen());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          children: [
            // Image
            Container(
              height: 90.h,
              width: 100.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xFFfafafa),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SvgPicture.asset(
                  AppImages.favourite,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      points,
                      style: AppTextStyles.bodyText.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return const TicketExchangeDialog();
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFfff6c9),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 8,
                  ),
                  child: Text('교환', style: AppTextStyles.bodyText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
