import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class App035 extends StatefulWidget {
  const App035({super.key});

  @override
  State<App035> createState() => _App035State();
}

class _App035State extends State<App035> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithPoints(),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            _buildBannerSection(),
            SizedBox(height: 30.h),

            SizedBox(
              height: 80.h,
              child: Row(
                children: [
                  // image
                  const CircleAvatar(backgroundColor: Colors.black),
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
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
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
                      Positioned(
                        // tweak these to position exactly where you want
                        top: -30.h,
                        right: 0.w,
                        child: Image.asset(AppImages.tooltip035, height: 40.h),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => SizedBox(
                  height: 80.h,
                  child: Row(
                    children: [
                      // image
                      const CircleAvatar(backgroundColor: Colors.black),
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

  Widget _buildBannerSection() {
    return SizedBox(
      height: 150.h,
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        children: [
          // PageView
          PageView(
            controller: _pageController,

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
                controller: _pageController,
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
