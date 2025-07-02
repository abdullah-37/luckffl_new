import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/app/widgets/running_outof_ticket_dialogue.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class TodaysLuckyChanceView extends StatelessWidget {
  const TodaysLuckyChanceView({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController navController = Get.find<BottomNavController>();
    const List list = [true, false, true, false, true, false];
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: const AppbarWithPoints(backgroundColor: Color(0xFFffffff)),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    navController.currentIndex.value = 1;
                    Get.back();
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.ticket, height: 40.h),
                      Image.asset(AppImages.tooltiproulette, height: 60.h),
                    ],
                  ),
                ),
                // Ticket counters section
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    spacing: 10,
                    children: [
                      _buildTicketCounter('브론즈 티켓', 3, Colors.brown),
                      _buildTicketCounter('실버 티켓', 3, Colors.grey),
                      _buildTicketCounter('골드 티켓', 3, Colors.amber),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFfafafa),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: '실시간 당첨자 ', style: AppTextStyles.bodyText),
                    TextSpan(
                      text: '@123456님,  신세계 상품권 10만원권 당첨!',
                      style: AppTextStyles.bodyText.copyWith(
                        color: const Color(0xFF9d7aff),
                      ),
                    ),
                    TextSpan(text: '당첨!', style: AppTextStyles.bodyText),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8.h),
            Expanded(
              child: GridView.builder(
                itemCount: list.length,
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.55, // Adjust to fit your content
                ),
                itemBuilder: (context, index) {
                  bool isAvailable = list[index];
                  return GestureDetector(
                    onTap: () {
                      if (!isAvailable) {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              const RunningOutofTicketDialogue(),
                        );
                      }

                      if (isAvailable) {
                        showDialog(
                          context: context,
                          builder: (context) => Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0,
                                      vertical: 20,
                                    ),
                                    child: Image.asset(
                                      AppImages.x,
                                      height: 20.h,
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '띵동~ 선물 도착!',
                                      style: AppTextStyles.bodytitleLarge
                                          .copyWith(color: Colors.white),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Get.back();
                                        // Get.to(() => const App28());
                                        Get.toNamed(AppPages.app28);
                                      },
                                      child: Image.asset(
                                        AppImages.mysterybox,
                                        height: 300.h,
                                      ),
                                    ),
                                    Text(
                                      '띵동~ 선물 도착!',
                                      style: AppTextStyles.bodytitleLarge
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 100.h),
                              const Spacer(),
                            ],
                          ),
                        );
                      }
                    },
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: const BoxDecoration(
                        // borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                        // boxShadow: const [
                        //   BoxShadow(color: Colors.black12, blurRadius: 4),
                        // ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://picsum.photos/400/200?random=${index + 1}',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 120, // Fixed image height
                              ),
                            ),
                          ),

                          // Content padding
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '네이버페이',
                                  style: AppTextStyles.bodySubtitle,
                                ),
                                Text('네이버페이', style: AppTextStyles.bodyText),
                                const SizedBox(height: 6),
                                SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},

                                    icon: SvgPicture.asset(
                                      AppImages.favourite,
                                      colorFilter: const ColorFilter.mode(
                                        Color(0xFF86360c),
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    label: Text(
                                      "3",
                                      style: AppTextStyles.bodyText,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      backgroundColor: const Color(0xFFfff6c9),

                                      textStyle: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                CustomElevatedButton(
                                  onTap: () {},
                                  title: '25개 남음',
                                  color: const Color(0xFFfafafa),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // button
            CustomElevatedButton(
              onTap: () {
                // Get.to(() => const App044());
                Get.toNamed(AppPages.app044);
              },
              title: '당첨 후기 보기',
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketCounter(String title, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFfafafa),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImages.favourite,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
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
