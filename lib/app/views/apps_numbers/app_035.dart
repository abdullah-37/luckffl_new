import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class App035 extends StatelessWidget {
  const App035({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    final PageController controller = PageController();
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: const AppbarWithPoints(),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            _buildBannerSection(pageController),
            SizedBox(height: 30.h),

            Column(
              children: [
                SizedBox(
                  height: 100.h,
                  child: PageView(
                    controller: controller,
                    children: List.generate(
                      3,
                      (index) => _buildCustomCard(index),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: WormEffect(
                    dotHeight: 5.h,
                    dotWidth: 5.w,
                    activeDotColor: AppColors.primaryColor,
                    dotColor: Colors.grey.shade300,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => SizedBox(
                  height: 80.h,
                  child: Row(
                    children: [
                      // image
                      // const CircleAvatar(
                      //   backgroundColor: Colors.black,
                      //   radius: 30,
                      // ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFf1f4f9),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                        ),
                        height: 60.h,
                        width: 60.h,
                        child: const Stack(
                          children: [
                            Positioned(
                              right: 0,
                              top: 0,

                              child: CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                radius: 8,
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10.w),

                      // text column
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('쿠팡', style: AppTextStyles.bodySubtitle),
                          Text(
                            '쿠팡클릭하고 포인트 받기',
                            style: AppTextStyles.bodytitlesmall,
                          ),
                        ],
                      ),

                      const Spacer(),

                      // Wrap the button + tooltip in a Stack

                      // 1) The rounded “클릭” button
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFfff6c9),
                          borderRadius: BorderRadius.circular(1000),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 13.h,
                        ),
                        child: Text('클릭', style: AppTextStyles.bodyText),
                      ),

                      // 2) The tooltip image, positioned relative to the button
                    ],
                  ),
                ),
              ),
            ),

            ///

            //
          ],
        ),
      ),
    );
  }

  Widget _buildCustomCard(int index) {
    return SizedBox(
      height: 80.h,
      child: Row(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFf1f4f9),
            ),
            height: 60.h,
            width: 60.h,
          ),
          SizedBox(width: 10.w),

          // text column
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('쿠팡 $index', style: AppTextStyles.bodySubtitle),
              Text('쿠팡클릭하고 포인트 받기', style: AppTextStyles.bodytitlesmall),
            ],
          ),

          const Spacer(),

          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFfff6c9),
                  borderRadius: BorderRadius.circular(1000),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 13.h),
                child: Text('클릭', style: AppTextStyles.bodyText),
              ),
              Positioned(
                top: -30.h,
                right: 0.w,
                child: Image.asset(AppImages.tooltip035, height: 40.h),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBannerSection(PageController pageController) {
    return SizedBox(
      height: 150.h,
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          // PageView
          PageView(
            controller: pageController,

            children: [
              _buildBannerCard(
                '친구한테 공유하고\n하트 힐링 같이 하자 !',
                'https://picsum.photos/400/200?random=1',
              ),
              _buildBannerCard(
                '새로운 이벤트가\n시작되었습니다!',
                'https://picsum.photos/400/200?random=2',
              ),
              _buildBannerCard(
                '특별한 혜택을\n놓치지 마세요!',
                'https://picsum.photos/400/200?random=3',
              ),
            ],
          ),

          // Page Indicator
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const WormEffect(
                  dotWidth: 8,
                  dotHeight: 8,
                  spacing: 6,
                  dotColor: Colors.white54,
                  activeDotColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBannerCard(String text, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB), Color(0xFF90CAF9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFE3F2FD),
                            Color(0xFFBBDEFB),
                            Color(0xFF90CAF9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
