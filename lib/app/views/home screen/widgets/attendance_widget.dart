import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:luck_ffle/app/views/apps_numbers/app_023.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class AttendanceCheckInWidget extends StatefulWidget {
  const AttendanceCheckInWidget({super.key});

  @override
  State<AttendanceCheckInWidget> createState() =>
      _AttendanceCheckInWidgetState();
}

class _AttendanceCheckInWidgetState extends State<AttendanceCheckInWidget> {
  int checkedDays = 1; // Day 1 is already checked

  final List<String> days = ['1일', '오늘', '3일', '4일', '5일', '6일', '7일'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header section with title and coin stack
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('출석체크 하면', style: AppTextStyles.bodytitleLarge),
                    const SizedBox(height: 4),
                    Text('매일 쌓아지는 포인트!', style: AppTextStyles.bodytitleLarge),
                  ],
                ),
              ),

              // Coin stack illustration
              SizedBox(
                width: 100.w,
                height: 100.w,
                child: Image.asset(AppImages.attendanceImage),
              ),
            ],
          ),

          SizedBox(height: 10.h),

          // Attendance circles
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(7, (index) {
              final isChecked = index < checkedDays;
              final isToday = index == 1; // "오늘" is the second item
              final isSpecial = index == 6; // 7th day is special

              return Column(
                children: [
                  // Circle with P or star
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isSpecial && !isChecked
                          ? Colors.transparent
                          : isChecked
                          ? const Color(0xFFFFD700)
                          : const Color(0xFFE0E0E0),
                      shape: BoxShape.circle,
                      boxShadow: isChecked
                          ? [
                              BoxShadow(
                                color: const Color(
                                  0xFFFFD700,
                                ).withValues(alpha: 0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ]
                          : null,
                    ),
                    child: Center(
                      child: isSpecial
                          ? SvgPicture.asset(
                              AppImages.favourite,
                              colorFilter: const ColorFilter.mode(
                                Color(
                                  0xFFff5b06,
                                ), // Change to your desired color
                                BlendMode.srcIn,
                              ),
                            )
                          : Text(
                              'P',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Day label
                  Text(
                    days[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: isToday ? Colors.black : Colors.grey.shade600,
                    ),
                  ),
                ],
              );
            }),
          ),

          const SizedBox(height: 40),

          // Check-in button
          CustomElevatedButton(
            isRounded: true,
            onTap: () {
              Get.to(() => const App023());
            },
            title: '오늘도 출첵하기',
          ),
        ],
      ),
    );
  }
}

// Usage example
//
