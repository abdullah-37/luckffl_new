import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class PointsWidget extends StatelessWidget {
  const PointsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195.w,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.only(right: 25.0),
      decoration: BoxDecoration(
        color: AppColors.scaffoldcolour,
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
              Text('1,234', style: AppTextStyles.bodyTextSmall),
            ],
          ),
          const VerticalDivider(color: Color(0xFFe7eae9)),

          // Second row
          Row(
            spacing: 10,

            children: [
              SvgPicture.asset(AppIcons.pIcon),
              Text('1,234', style: AppTextStyles.bodyTextSmall),
            ],
          ),
        ],
      ),
    );
  }
}
