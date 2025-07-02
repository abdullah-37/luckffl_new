import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/challenge_widget.dart';
import 'package:luck_ffle/app/widgets/points_widget.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RewardsView extends StatefulWidget {
  const RewardsView({super.key});

  @override
  State<RewardsView> createState() => _RewardsViewState();
}

class _RewardsViewState extends State<RewardsView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '혜택',
          style: AppTextStyles.bodytitleLarge.copyWith(fontSize: 30),
        ),
        actions: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: PointsWidget(),
          ),
          SizedBox(width: 10.w),
        ],
      ),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBannerSection(),
            SizedBox(height: 10.h),
            Text('오늘의 럭키 찬스', style: AppTextStyles.bodytitleLarge),
            Expanded(
              child: ListView(
                children: [
                  FirstComeChallengeWidget(
                    image: AppImages.threeone,
                    onTap: () {
                      Get.toNamed(AppPages.app023);
                    },
                    title: '오늘도 출석 도장 꾹!',
                    subtitle: '출석하고 포인트 챙겨가세요!',
                  ),
                  FirstComeChallengeWidget(
                    image: AppImages.alarmclock,
                    onTap: () {
                      Get.toNamed(AppPages.app033);
                    },
                    title: '럭플 타임 OPEN!',
                    subtitle: '하루 4번 열리는 찬스, 포인트를 GET!',
                  ),
                  FirstComeChallengeWidget(
                    image: AppImages.leafhand,
                    onTap: () {
                      Get.toNamed(AppPages.todaysLuckyChanceView);
                    },
                    title: '오늘의 행운을 뽑아보세요!',
                    subtitle: '티켓픽으로 상품뽑기 도전!',
                  ),
                  FirstComeChallengeWidget(
                    image: AppImages.colorwheel,
                    onTap: () {
                      Get.toNamed(AppPages.rouletteLuckyChanceView);
                    },
                    title: '룰렛을 돌리고 티켓을 GET!',
                    subtitle: '오늘의 행운, 룰렛을 돌려보세요!',
                  ),
                  FirstComeChallengeWidget(
                    image: AppImages.handshock,
                    onTap: () {},
                    title: '포인트 충전소',
                    subtitle: '충전소에서 해결하세요!',
                  ),
                  FirstComeChallengeWidget(
                    image: AppImages.handpoint,
                    onTap: () {
                      Get.toNamed(AppPages.app035);
                    },
                    title: '클릭하면 적립',
                    subtitle: '클릭하고 포인트 적립하기!',
                  ),
                  FirstComeChallengeWidget(
                    image: AppImages.challenge,
                    onTap: () {
                      Get.toNamed(AppPages.app036);
                    },
                    title: '선착순 미션',
                    subtitle: '한정 포인트, 마감되기 전에!',
                  ),
                ],
              ),
            ),
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
            onPageChanged: (index) {},
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
