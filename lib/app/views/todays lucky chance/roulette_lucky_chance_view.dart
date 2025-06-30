import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/todays%20lucky%20chance/roulette_spin_screen.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class RouletteLuckyChanceView extends StatelessWidget {
  const RouletteLuckyChanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: const AppbarWithPoints(),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          spacing: 10,
          children: [
            // tool tip
            Row(
              children: [
                SvgPicture.asset(AppImages.point, height: 40.h),
                Image.asset(AppImages.tooltiplu, height: 60.h),
              ],
            ),
            //image
            SizedBox(
              height: 200.h,
              child: Stack(
                children: [
                  Image.asset(AppImages.roller),
                  Image.asset(AppImages.confetti),
                ],
              ),
            ),
            //text
            Text('룰렛 종류를 선택해주세요!', style: AppTextStyles.bodytitlesmall),

            const CustomTicketContainer(
              ticketimage: AppImages.ticketbrown,
              text: '브론즈 룰렛',
              points: '100',
            ),
            const CustomTicketContainer(
              ticketimage: AppImages.ticketgrey,
              text: '브론즈 룰렛',
              points: '200',
            ),
            const CustomTicketContainer(
              ticketimage: AppImages.ticketyellow,
              text: '브론즈 룰렛',
              points: '300',
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTicketContainer extends StatelessWidget {
  final String ticketimage;
  final String text;
  final String points;

  const CustomTicketContainer({
    super.key,
    required this.ticketimage,
    required this.text,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const RouletteSpinScreen());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 100.h,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFe7eae9)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image
            SvgPicture.asset(ticketimage),
            Text(text, style: AppTextStyles.bodytitleLarge),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFfafafa),
                borderRadius: BorderRadius.circular(10000),
              ),
              child: Row(
                spacing: 5,
                children: [
                  SvgPicture.asset(AppImages.point),
                  Text(
                    points,
                    style: AppTextStyles.bodyText.copyWith(
                      color: Colors.red,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
