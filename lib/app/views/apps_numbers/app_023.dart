import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/todays%20lucky%20chance/roulette_lucky_chance_view.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App023 extends StatelessWidget {
  const App023({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithPoints(),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          spacing: 10,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('매일 출석하기', style: AppTextStyles.bodySubtitle),
            ),

            Row(
              children: [
                Text('1일차 성공', style: AppTextStyles.bodytitleLarge),
                Text(
                  '/ 7일',
                  style: AppTextStyles.bodySubtitle.copyWith(fontSize: 18),
                ),
              ],
            ),
            //
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(AppImages.point),
                Expanded(
                  child: Text(
                    '매일 출석 성공하면 보너스 포인트와 티켓 지급!',
                    style: AppTextStyles.bodySubtitle.copyWith(fontSize: 18),
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,

              children: [
                SvgPicture.asset(AppImages.playpurple),
                Text(
                  ' 광고 시청 후 1일 출석 만회 가능        ',
                  style: AppTextStyles.bodySubtitle.copyWith(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            //
            const Divider(),

            //
            SizedBox(
              height: 350.h,
              width: double.infinity,
              child: Stack(
                children: [
                  // 1) the painter behind
                  CustomPaint(
                    size: Size(double.infinity, 400.h),
                    painter: ConnectionPainter(),
                  ),

                  // 2) your three rows of circles on top
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // first row: 3 circles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                '출석 \n +2',
                                style: AppTextStyles.bodyText.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          //
                          Container(
                            height: 60,
                            width: 60,

                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF9d7aff),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AppImages.playpurple,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  Text(
                                    '광고시청',
                                    style: AppTextStyles.bodyText.copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primaryColor,
                              // border: Border.all(color: AppColors.primaryColor),
                            ),

                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    '출석하기',
                                    style: AppTextStyles.bodyText.copyWith(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      // second row: 2 circles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFfafafa),
                              // border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                '5일차 \n 10P',
                                style: AppTextStyles.bodyText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFfafafa),
                              // border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                '4일차 \n 10P',
                                style: AppTextStyles.bodyText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // third row: 2 circles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFfafafa),
                              // border: Border.all(color: AppColors.primaryColor),
                            ),
                            child: Center(
                              child: Text(
                                '6일차 \n 10P',
                                style: AppTextStyles.bodyText.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => const CustomDialuge023(),
                              );
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFfafafa),
                                // border: Border.all(color: AppColors.primaryColor),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      AppImages.ticket,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFFff5b06),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    Text(
                                      '7일차',
                                      style: AppTextStyles.bodyText.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFf4f7fb),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Row
                  Row(
                    spacing: 10,
                    children: [
                      //icon
                      SvgPicture.asset(AppImages.heartcomment),
                      //text
                      Text(
                        '출석 꿀팁!',
                        style: AppTextStyles.bodyText.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  //

                  //
                  Text(
                    '• 하루 1번만 출석 가능해요 \n• 실수해도 광고 보면 만회 가능!  \n• 7일마다 보너스 티켓 🎁  \n• 출석 초기화: 매일 자정 (00:00)',
                    style: AppTextStyles.bodySubtitle,
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

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(backgroundColor: Colors.red, radius: 30);
  }
}

class ConnectionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // match your CustomCircle radius
    final double r = 30.sp;
    final double diameter = 2 * r;

    // vertical spacing above, between, below the 3 circles:
    final double vSpace = (size.height - 3 * diameter) / 4;

    // exact Y‑centers of row 1, 2, 3
    final double y1 = vSpace + r;
    final double y2 = vSpace * 2 + diameter + r;
    final double y3 = vSpace * 3 + diameter * 2 + r;

    // horizontal centers for first row (spaceBetween):
    final double x1 = r; // left circle at x = radius
    final double x2 = size.width / 2; // middle circle at center
    final double x3 = size.width - r; // right circle at width - radius

    // horizontal centers for rows 2 & 3 (spaceAround approximated):
    final double xLeft = size.width * 1 / 4;
    final double xRight = size.width * 3 / 4;

    // ─── A) Straight top‐row connections ───
    canvas.drawLine(Offset(x1, y1), Offset(x2, y1), paint);
    canvas.drawLine(Offset(x2, y1), Offset(x3, y1), paint);

    // ─── B) Fully curved: top‑right → middle‑right ───
    {
      final p1 = Offset(x3, y1);
      final p2 = Offset(xRight, y2);
      final cp = Offset(p1.dx + 40.w, (p1.dy + p2.dy) / 2);
      final path = Path()
        ..moveTo(p1.dx, p1.dy)
        ..quadraticBezierTo(cp.dx, cp.dy, p2.dx, p2.dy);
      canvas.drawPath(path, paint);
    }

    // ─── C) Fully curved: middle‑left → bottom‑left ───
    {
      final p1 = Offset(xLeft, y2);
      final p2 = Offset(xLeft, y3);
      final cp = Offset(p1.dx - 40.w, (p1.dy + p2.dy) / 2);
      final path = Path()
        ..moveTo(p1.dx, p1.dy)
        ..quadraticBezierTo(cp.dx, cp.dy, p2.dx, p2.dy);
      canvas.drawPath(path, paint);
    }

    // ─── D) Straight mid‑row and bottom‑row connections ───
    canvas.drawLine(Offset(xLeft, y2), Offset(xRight, y2), paint);
    canvas.drawLine(Offset(xLeft, y3), Offset(xRight, y3), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CustomDialuge023 extends StatelessWidget {
  const CustomDialuge023({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.w,
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            //image
            Image.asset(AppImages.partyingface, height: 80.h),
            Text('축하해요!', style: AppTextStyles.bodytitlesmall),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.ticketbrown, height: 30.h),
                Text('+ 브론즈 티켓 3장', style: AppTextStyles.bodytitlesmall),
              ],
            ),
            // Action buttons
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      Get.to(() => const RouletteLuckyChanceView());
                    },
                    title: '그만하기',
                    color: const Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(onTap: () {}, title: '한번 더'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
