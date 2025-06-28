import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(
              255,
              206,
              206,
              206,
            ).withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(1000.r),
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // First row
              Row(
                spacing: 10,

                children: [
                  SvgPicture.asset(
                    AppImages.favourite,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFFff5b06), // Change to your desired color
                      BlendMode.srcIn,
                    ),
                  ),
                  Text('1,234', style: AppTextStyles.bodytitlesmall),
                ],
              ),
              Container(
                width: 2.w,
                height: 20.h,
                decoration: const BoxDecoration(color: Colors.grey),
              ),
              // Second row
              Row(
                spacing: 10,

                children: [
                  SvgPicture.asset(AppImages.point),
                  Text('1,234', style: AppTextStyles.bodytitlesmall),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
