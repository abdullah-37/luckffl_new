import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class FirstComeChallengeWidget extends StatelessWidget {
  final String image;
  final GestureTapCallback onTap;
  final String title;
  final String subtitle;

  const FirstComeChallengeWidget({
    super.key,
    required this.image,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                Image.asset(image, height: 70.h),
                // column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.bodytitlesmall),
                    Text(subtitle, style: AppTextStyles.bodySubtitle),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
