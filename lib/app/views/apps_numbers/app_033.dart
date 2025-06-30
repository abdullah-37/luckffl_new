import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luck_ffle/app/views/profile%20view/settings/setting_screen.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App033 extends StatelessWidget {
  const App033({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      // bottomNavigationBar: Padding(d
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //   child: CustomElevatedButton(onTap: () {}, title: "후기 등록"),
      // ),
      appBar: const AppbarWithPoints(),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            SizedBox(height: 10.h),
            //
            Image.asset(AppImages.timer, height: 100.h),
            Text(
              textAlign: TextAlign.center,
              '하루 4번! 정해진 시간에만 열리는\n 특별한 보너스 타임 🎁',
              style: AppTextStyles.bodytitlesmall,
            ),

            // SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              "포인트 놓치지 말고 알람 설정하고 참여해보세요!",
              style: AppTextStyles.bodyText,
            ),
            //
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                padding: const EdgeInsets.all(0),

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  // childAspectRatio: 0.9,
                ),
                itemBuilder: (context, index) {
                  // final slot = timeSlots[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFfafafa),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '09:00~10:00',
                          style: AppTextStyles.bodyText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '럭플 타임',
                          style: AppTextStyles.bodyText.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const CustomToggel(),
                        CustomElevatedButton(
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
                                      onTap: () {},
                                      title: "확인",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          title: '종료',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFfafafa),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                '• 알림 ON 하는 경우, 오늘의 보너스 포인트 지급 오픈 시 알림을 보내드립니다.\n• 해당 이벤트는 사전고지 없이 종료될 수 있습니다.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
