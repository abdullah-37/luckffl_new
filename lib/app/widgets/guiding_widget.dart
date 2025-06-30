import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:luck_ffle/app/controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/views/home%20screen/home_screen.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/challenge_widget.dart';
import 'package:luck_ffle/app/views/point%20shop/point_shop_view.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class GuidingWidget extends StatelessWidget {
  const GuidingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController navController = Get.find<BottomNavController>();

    return Obx(
      () => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(1.0),
            ],
          ),
        ),
        child: Padding(
          padding: Constants.horizontalPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              if (navController.currentIndex.value == 0 &&
                  navController.isLastStep.value == false)
                _buildFirstStep(navController, context),
              if (navController.currentIndex.value == 1)
                _buildSecondStep(context),
              if (navController.currentIndex.value == 2)
                _buildThirdStep(context),
              if (navController.currentIndex.value == 3)
                _buildFourthStep(context),

              if (navController.isLastStep.value == true) _buildLastStep(),
              const Spacer(),
              CustomElevatedButton(
                onTap: () {
                  if (navController.currentIndex.value < 3 &&
                      !navController.isLastStep.value) {
                    navController.changeIndex(
                      navController.currentIndex.value + 1,
                    );
                  } else if (navController.isLastStep.value) {
                    navController.isGuidingFinished.value = true;

                    // Optionally: Do something after last step
                    // controller.changeIndex(0); // restart
                    // Get.back(); // close the guide
                    // or show a message
                  } else {
                    navController.currentIndex.value = 0;
                    navController.isLastStep.value = true;
                  }
                },
                title: navController.isLastStep.value == true
                    ? '럭플 시작하기'
                    : '다음',
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstStep(
    BottomNavController navController,
    BuildContext context,
  ) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:
                AppBar().preferredSize.height +
                MediaQuery.of(context).padding.top,
          ),
          SizedBox(height: 200.h),

          //
          SizedBox(
            height: 145,
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFffffff),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Material(
                    color: const Color(0xFFffffff),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // First row
                        Row(
                          spacing: 10,

                          children: [
                            SvgPicture.asset(
                              AppImages.favourite,
                              height: 20.h,
                              colorFilter: const ColorFilter.mode(
                                Color(
                                  0xFFff5b06,
                                ), // Change to your desired color
                                BlendMode.srcIn,
                              ),
                            ),
                            Text('1,234', style: AppTextStyles.bodytitlesmall),
                          ],
                        ),
                        Container(
                          width: 2.w,
                          height: 20.h,
                          decoration: const BoxDecoration(
                            color: Color(0xFFf5f6fa),
                          ),
                        ),
                        // Second row
                        Row(
                          spacing: 10,

                          children: [
                            SvgPicture.asset(AppIcons.pIcon, height: 30.h),

                            Text('1,234', style: AppTextStyles.bodytitlesmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 5,
                  right: 0,
                  left: 0,
                  child: TimelineWidget(),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          // Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              textAlign: TextAlign.start,
              '내 리워드 확인하기',

              style: AppTextStyles.bodytitleLarge.copyWith(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              textAlign: TextAlign.start,
              '지금 보유 중인 티켓과 포인트예요!',

              style: AppTextStyles.bodytitleLarge.copyWith(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              textAlign: TextAlign.start,
              '이벤트 참여나 상품 교환에 사용할 수 있어요.',

              style: AppTextStyles.bodytitleLarge.copyWith(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),

          //
        ],
      ),
    );
  }

  // Step 2
  Widget _buildSecondStep(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Material(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height:
                  AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top,
            ),

            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 340,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          Constants.defaultRadius - 10,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Styled tabs bar (copied from LuckyBoardView)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 0,
                            ),
                            child: TabBar(
                              isScrollable: true,
                              tabAlignment: TabAlignment.start,
                              dividerColor: Colors.transparent,
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                              tabs: const [
                                Tab(text: '진행중'),
                                Tab(text: '진행예정'),
                                Tab(text: '종료'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                _buildProductList(tab: '진행중'),
                                _buildProductList(tab: '진행예정'),
                                _buildProductList(tab: '종료'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
                const Positioned(
                  right: 0,
                  left: 0,
                  bottom: 5,

                  child: TimelineWidget(),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            //
            // Text description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                textAlign: TextAlign.start,
                '티켓으로 응모해요!\n친구에게 공유하고, \n티켓으로 이벤트에 참여할 수 있어요.',

                style: AppTextStyles.bodytitleLarge.copyWith(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///
  Widget _buildThirdStep(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height:
              AppBar().preferredSize.height +
              MediaQuery.of(context).padding.top,
        ),
        SizedBox(height: 10.h),
        Text('', style: AppTextStyles.bodytitleLarge),
        // SizedBox(height: 50.h),
        Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  // height: 340.h,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldcolour,
                    borderRadius: BorderRadius.circular(
                      Constants.defaultRadius - 10,
                    ),
                  ),
                  child: Material(
                    child: Column(
                      spacing: 10,
                      children: [
                        FirstComeChallengeWidget(
                          title: '오늘도 출석 도장 꾹!',
                          subtitle: '출석하고 포인트 챙겨가세요!',
                          image: AppImages.threeone,
                          onTap: () {},
                        ),
                        FirstComeChallengeWidget(
                          image: AppImages.timer,
                          onTap: () {},
                          title: '럭플 타임 OPEN!',
                          subtitle: '하루 4번 열리는 찬스, 포인트를 GET!',
                        ),

                        FirstComeChallengeWidget(
                          image: AppImages.leafhand,
                          onTap: () {},
                          title: '오늘의 행운을 뽑아보세요!',
                          subtitle: '티켓픽으로 상품뽑기 도전!',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
            const Positioned(
              right: 0,
              left: 0,
              bottom: 5,

              child: TimelineWidget(),
            ),
          ],
        ),
        // const TimelineWidget(),
        SizedBox(height: 20.h),

        //
        // Text description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            textAlign: TextAlign.start,
            '출석만 해도 포인트 GET!.',

            style: AppTextStyles.bodytitleLarge.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            textAlign: TextAlign.start,
            '매일 참여 가능한 다양한 미션으로',

            style: AppTextStyles.bodytitleLarge.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            textAlign: TextAlign.start,
            '포인트와 티켓을 모아보세요',

            style: AppTextStyles.bodytitleLarge.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }

  //
  Widget _buildFourthStep(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height:
              AppBar().preferredSize.height +
              MediaQuery.of(context).padding.top,
        ),
        Stack(
          children: [
            Column(
              children: [
                SizedBox(height: 100.h),
                Container(
                  padding: const EdgeInsets.all(10),
                  // height: 340.h,
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldcolour,
                    borderRadius: BorderRadius.circular(
                      Constants.defaultRadius - 10,
                    ),
                  ),
                  child: const Material(child: PopularItemsWidget()),
                ),
                const SizedBox(height: 100),
              ],
            ),
            const Positioned(
              right: 0,
              left: 0,
              bottom: 5,

              child: TimelineWidget(),
            ),
          ],
        ),
        // const TimelineWidget(),
        SizedBox(height: 20.h),

        //
        // Text description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            textAlign: TextAlign.start,
            '포인트로 교환해요!',

            style: AppTextStyles.bodytitleLarge.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            textAlign: TextAlign.start,
            '모은 포인트로 원하는 ',

            style: AppTextStyles.bodytitleLarge.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            textAlign: TextAlign.start,
            '상품을 바로 받을 수 있어요.',

            style: AppTextStyles.bodytitleLarge.copyWith(
              color: Colors.white,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastStep() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 200.h),
          Image.asset(AppImages.finishguiding, height: 200.h),

          // Text description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              textAlign: TextAlign.start,
              '준비 완료!',

              style: AppTextStyles.bodytitleLarge.copyWith(
                color: Colors.white,
                fontSize: 25,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          SizedBox(height: 20.h),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              textAlign: TextAlign.center,
              '이제 본격적으로 즐겨볼까요?티켓 받고, 응모하고, 보상까지 놓치지 마세요 🎁',

              style: AppTextStyles.bodytitleLarge.copyWith(
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ////
  Widget _buildProductList({required String tab}) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        _buildProductCard(
          index: 0,
          backgroundColor: const Color(0xFFe8eaff),
          imageUrl:
              'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400&h=300&fit=crop',
          title: '아이디어스',
          subtitle: '친구에게 공유하고 티켓 1장 획득!',
        ),
      ],
    );
  }

  Widget _buildProductCard({
    required int index,
    required Color backgroundColor,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Constants.defaultRadius),
        // border: Border.all(
        //   color: border ? Color(0xFFd8d8d8) : Colors.transparent,
        // ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.08),
        //     blurRadius: 10,
        //     offset: const Offset(0, 2),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          // Image section
          Container(
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                // Background pattern (optional dots)
                if (backgroundColor == const Color(0xFFFFF9C4))
                  Positioned.fill(
                    child: CustomPaint(painter: DotPatternPainter()),
                  ),

                // NEW badge
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFe8e2fe),
                      borderRadius: BorderRadius.circular(
                        Constants.defaultRadius,
                      ),
                    ),
                    child: const Text(
                      '종료 임박',
                      style: TextStyle(
                        color: Color(0xFF9d7aff),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Star icon
                // Positioned(
                //   top: 16,
                //   right: 16,
                //   child: GestureDetector(
                //     onTap: () {
                //       setState(() {
                //         starStates[index] = !starStates[index];
                //       });
                //     },
                //     child: SvgPicture.asset(
                //       AppImages.favourite,
                //       colorFilter: ColorFilter.mode(
                //         starStates[index]
                //             ? Colors.grey
                //             : Color(0xFFffc506), // Change to your desired color
                //         BlendMode.srcIn,
                //       ),
                //     ),
                //   ),
                // ),

                // Product image
                Center(
                  child: SizedBox(
                    width: 120.w,
                    height: 120.h,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        Constants.defaultRadius,
                      ),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.image,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey.shade200,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Text section
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              border: Border(
                left: BorderSide(color: Color(0xFFd8d8d8)),
                right: BorderSide(color: Color(0xFFd8d8d8)),
                bottom: BorderSide(color: Color(0xFFd8d8d8)),
              ),
            ),

            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(title, style: AppTextStyles.bodytitlesmall),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFfafafa),
                        borderRadius: BorderRadius.circular(1000),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          //image
                          SvgPicture.asset(
                            AppImages.favourite,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF86360c), // Change to your desired color
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 10.sp),
                          //text
                          const Text(
                            '3',
                            style: TextStyle(
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
                const SizedBox(height: 8),
                Text(subtitle, style: AppTextStyles.bodySubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopularItemsWidget extends StatelessWidget {
  const PopularItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('포인트샵 인기템 TOP!', style: AppTextStyles.bodytitleLarge),
        SizedBox(height: 20.h),
        const SizedBox(
          // height: 220.h,
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopularItemCard(
                imageUrl: "https://picsum.photos/400/300?random=1",
                category: '커피/음료',
                title: '스타벅스 아이스아메리카노 Tall',
                points: '16,000',
                step: 3,
              ),
              PopularItemCard(
                imageUrl: "https://picsum.photos/400/300?random=2",
                category: '베이커리/도넛',
                title: '던킨 콜드(아메리카노+글레이즈드)',
                points: '16,000',
                step: 0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TimelineWidget extends StatelessWidget {
  final double height;
  final double circleSize;
  final double lineWidth;
  final Color backgroundColor;

  const TimelineWidget({
    super.key,
    this.height = 250.0,
    this.circleSize = 16.0,
    this.lineWidth = 2.0,
    this.backgroundColor = const Color(0xFFF5F5F0),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Circle at the top
            Container(
              width: circleSize,
              height: circleSize,
              decoration: const BoxDecoration(
                color: Color(0xFFf6b04e),
                shape: BoxShape.circle,
              ),
            ),
            // Vertical line
            Container(
              width: lineWidth,
              height:
                  height -
                  150 -
                  circleSize, // Adjust height to account for padding and circle
              color: const Color(0xFFf6b04e),
            ),
          ],
        ),
      ),
    );
  }
}
