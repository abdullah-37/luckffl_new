import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App044 extends StatelessWidget {
  const App044({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //   child: CustomElevatedButton(onTap: () {}, title: "후기 등록"),
      // ),
      appBar: const AppbarWithPoints(),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 30.h),
            //
            Image.asset(AppImages.partyingface, height: 60.h),
            Text(
              textAlign: TextAlign.center,
              '📢 오늘도 행운의 주인공이 탄생했어요!',
              style: AppTextStyles.bodytitlesmall,
            ),
            SizedBox(height: 10.h),

            Row(
              spacing: 5,
              children: [
                const Expanded(child: Divider(color: AppColors.primaryColor)),
                Text("실시간 당첨 후기", style: AppTextStyles.bodyText),
                const Expanded(child: Divider(color: AppColors.primaryColor)),
              ],
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
                padding: const EdgeInsets.all(0),
                itemCount: 8,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    // vertical: 20.0,
                    horizontal: 20,
                  ),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      // horizontal: 20,
                    ),
                    decoration: const BoxDecoration(),
                    child: Row(
                      spacing: 20,
                      children: [
                        SvgPicture.asset(
                          AppImages.profile,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                        //
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@username',
                                style: AppTextStyles.bodytitlesmall,
                              ),
                              Text(
                                '스타벅스 아이스 아메리카노 Tall',
                                style: AppTextStyles.bodySubtitle,
                              ),
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                '가짜인지 알았어요 열심히 하세요 대박나세요',
                                style: AppTextStyles.bodySubtitle.copyWith(
                                  color: const Color(0xFF5A6BFF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
