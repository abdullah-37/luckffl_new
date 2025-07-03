import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/app_023_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/app/widgets/insuficient_poinst_dialogue.dart';
import 'package:luck_ffle/app/widgets/points_widget.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App023 extends GetView<App023Controller> {
  const App023({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 71;
    const double width = 71;
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xFFffffff),

        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
            child: PointsWidget(),
          ),
          // SizedBox(width: 10.w),
        ],
      ),
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
                  '광고 시청 후 1일 출석 만회 가능',
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

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // first row: 3 circles
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: height,
                            width: width,
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
                            height: height,
                            width: width,
                            padding: const EdgeInsets.all(10),

                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF9d7aff),
                            ),
                            child: Center(
                              child: Column(
                                spacing: 5,
                                mainAxisSize: MainAxisSize.min,
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
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: Column(
                                    spacing: 20,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const SizedBox(height: 10),
                                      //
                                      Image.asset(
                                        AppImages.partyingface,
                                        height: 60,
                                      ),
                                      Text(
                                        '축하해요!',
                                        style: AppTextStyles.bodytitlesmall,
                                      ),
                                      Row(
                                        spacing: 10,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            AppIcons.pIcon,
                                            height: 40,
                                          ),
                                          const Text(
                                            '+ 3P',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      CustomElevatedButton(
                                        onTap: () {
                                          Get.back();
                                          showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              backgroundColor: Colors.white,
                                              content: Column(
                                                spacing: 20,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  //
                                                  Image.asset(
                                                    AppImages.advertisement,
                                                    height: 100,
                                                  ),
                                                  Text(
                                                    '광고보고 포인트 2배 받기!',
                                                    style: AppTextStyles
                                                        .bodytitlesmall,
                                                  ),

                                                  Text(
                                                    '광고를 보면 포인트를 2배로 드려요!',
                                                    style: AppTextStyles
                                                        .bodySubtitle,
                                                  ),
                                                  Row(
                                                    spacing: 10,
                                                    children: [
                                                      Expanded(
                                                        child:
                                                            CustomElevatedButton(
                                                              onTap: () {},
                                                              title: "괜찮아요",
                                                              color:
                                                                  const Color(
                                                                    0xFFfafafa,
                                                                  ),
                                                            ),
                                                      ),
                                                      Expanded(
                                                        child:
                                                            CustomElevatedButton(
                                                              onTap: () {},
                                                              title: "광고보기",
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                        title: "확인",
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              height: height,
                              width: width,
                              padding: const EdgeInsets.all(10),

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
                                        fontSize: 10.sp,
                                      ),
                                    ),
                                  ],
                                ),
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
                            height: height,
                            width: width,
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
                            height: height,
                            width: width,
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
                          Column(
                            children: [
                              SizedBox(height: 20.h),

                              Container(
                                height: height,
                                width: width,
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
                            ],
                          ),
                          Stack(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 20.h),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            const CustomDialuge023(),
                                      );
                                    },
                                    child: Container(
                                      height: height,
                                      width: width,
                                      padding: const EdgeInsets.all(10),
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

                                              colorFilter:
                                                  const ColorFilter.mode(
                                                    Color(0xFFff5b06),
                                                    BlendMode.srcIn,
                                                  ),
                                            ),
                                            Text(
                                              '7일차',
                                              style: AppTextStyles.bodyText
                                                  .copyWith(
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
                              Positioned(
                                left: 0,
                                right: 0,
                                top: 0,
                                child: Image.asset(
                                  AppImages.app023tooltip,
                                  height: 40.h,
                                ),
                              ),
                            ],
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
      ..color = const Color(0xFFfafafa)
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
            SizedBox(height: 20.h),
            // Action buttons
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      // (() => const RouletteLuckyChanceView());
                      Get.toNamed(AppPages.rouletteLuckyChanceView);
                    },
                    title: '그만하기',
                    color: const Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      Get.back();
                      showDialog(
                        context: context,
                        builder: (context) => const InsuficientPoinstDialogue(),
                      );
                    },
                    title: '한번 더',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
