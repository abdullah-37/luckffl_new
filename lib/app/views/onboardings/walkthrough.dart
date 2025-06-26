import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/app/views/onboardings/login_bottomsheet.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, String>> walkthroughData = [
    {
      "image": AppImages.walkThrough1,
      "title": "친구에게 공유만 해도 티켓 지급!",
      "description": "이벤트 링크를 공유하면 티켓이 와르르! 친구도 받고 나도 받고 둘 다 혜택받는 행운을 공유해봐요.",
    },
    {
      "image": AppImages.walkThrough2,
      "title": "모은 티켓으로 럭키 래플 도전!",
      "description":
          "모은 티켓으로 커피부터 기프티콘까지 다양한 리워드에 응모해보세요. 매일매일 재미있는 행운이 기다리고 있어요!",
    },
    {
      "image": AppImages.walkThrough3,
      "title": "티켓과 포인트를 매일 쌓을 수 있어요",
      "description":
          "출석체크, 룰렛, 미션까지… 놀면서 쌓는 리워드 시스템! 광고도 보고, 재미도 얻고, 보상까지 챙기세요.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          child: Column(
            children: [
              Text(
                '공유하면 쌓이고, 쌓이면 터진다!',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 15.h),
              Image.asset(AppIcons.appLogo),
              SizedBox(height: 40.h),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: walkthroughData.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final data = walkthroughData[index];
                    return Column(
                      children: [
                        Image.asset(data["image"]!),
                        SizedBox(height: 25.h),
                        Text(
                          data["title"]!,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 45,
                            vertical: 15,
                          ),
                          child: Text(
                            data["description"]!,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  walkthroughData.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 4.h,
                    width: 12.w,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.sliderColor
                          : AppColors.unselectedSliderColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100.h),
              _buildKakaoButton(),
              SizedBox(height: 15.h),
              _buildOtherStartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKakaoButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        height: 50.h,
        width: 320.w,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SvgPicture.asset(AppIcons.buttonIcon),
            const Spacer(),
            Text(
              '카카오로 시작하기',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: AppColors.textColor,
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Widget _buildOtherStartButton() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => const LoginBottomsheet(),
        );
      },
      child: Container(
        height: 50.h,
        width: 320.w,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: AppColors.borderColor),
        ),
        child: Center(
          child: Text(
            '다른 방법으로 시작하기',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: AppColors.textColor,
            ),
          ),
        ),
      ),
    );
  }
}
