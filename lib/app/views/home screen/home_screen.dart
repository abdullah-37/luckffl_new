import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:luck_ffle/app/views/apps_numbers/app_036.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/attendance_widget.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/challenge_widget.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/couresel_widget.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/newly_opened_widget.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/popular_lucky_top_widget.dart';
import 'package:luck_ffle/app/views/home%20screen/widgets/todays_lucky_chance_widget.dart';
import 'package:luck_ffle/app/views/lucky%20zone%20detals%20view/end_application_details.dart';
import 'package:luck_ffle/app/views/lucky%20zone%20detals%20view/in_progress_lucky_zone_details.dart';
import 'package:luck_ffle/app/views/my%20points%20view/my_points_view.dart';
import 'package:luck_ffle/app/views/my%20tickets%20view/my_tickets_view.dart';
import 'package:luck_ffle/app/views/notification%20view/notifications_view.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // List<bool> starStates = [true, false, false]; //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Image.asset(AppImages.appbarlogo, height: 20.h),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const NotificationsView());
            },
            child: SvgPicture.asset(AppImages.bellicon),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // carousel header
            HorizontalCarousel(height: 200.h),
            SizedBox(height: 20.h),
            // Detail
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFffffff),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // First row
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        Get.to(() => const MyTicketsView());
                      },
                      child: Row(
                        spacing: 10,

                        children: [
                          SvgPicture.asset(
                            AppImages.favourite,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFFff5b06), // Change to your desired color
                              BlendMode.srcIn,
                            ),
                          ),
                          Text('1,234', style: AppTextStyles.bodytitlesmall),
                        ],
                      ),
                    ),
                    Container(
                      width: 2.w,
                      height: 20.h,
                      decoration: const BoxDecoration(color: Color(0xFFf5f6fa)),
                    ),
                    // Second row
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,

                      onTap: () {
                        Get.to(() => const MyPointsView());
                      },
                      child: Row(
                        spacing: 10,

                        children: [
                          SvgPicture.asset(AppIcons.pIcon),

                          Text('1,234', style: AppTextStyles.bodytitlesmall),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),

            // luckey Zone
            _buildLuckyZone(),
            SizedBox(height: 20.h),

            // Attendence
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: AttendanceCheckInWidget(),
            ),
            SizedBox(height: 20.h),

            // todays Lucky Chance
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: TodaysLuckyChanceWidget(),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: FirstComeChallengeWidget(
                image: AppImages.challenge,
                onTap: () {
                  Get.to(() => const App036());
                },
                title: '선착순 미션, 지금 바로 도전!',
                subtitle: '한정 포인트, 마감 되기 전에!',
              ),
            ),
            SizedBox(height: 20.h),

            // popular lucky top
            const PopularLuckyTopWidget(),
            SizedBox(height: 20.h),
            // Newly opened items
            const NewlyOpenedWidget(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLuckyZone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Constants.defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('럭키존', style: AppTextStyles.bodytitleLarge),
                  const Text(
                    '2주마다 찾아오는 럭키찬스!',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  const Text(
                    '티켓으로 바로 도전하세요!',
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Product List
            _buildProductCard(
              isActive: true,
              index: 0,
              backgroundColor: const Color(0xFFB5B5B5),
              imageUrl:
                  'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400&h=300&fit=crop',
              title: '럭키찬스',
              subtitle: '럭키존이 열렸습니다!\n티켓을 사용해 특별한 경품에 도전하세요!',
            ),

            _buildProductCard(
              isActive: false,
              index: 1,
              backgroundColor: const Color(0xFFfff9de),
              imageUrl:
                  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop',
              title: '럭키찬스',
              subtitle: '럭키존이 열렸습니다!\n티켓을 사용해 특별한 경품에 도전하세요!',
            ),

            _buildProductCard(
              isActive: true,

              index: 2,
              backgroundColor: const Color(0xFFfff9de),
              imageUrl:
                  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop',
              title: '럭키찬스',
              subtitle: '럭키존이 열렸습니다!\n티켓을 사용해 특별한 경품에 도전하세요!',
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required int index,
    required Color backgroundColor,
    required String imageUrl,
    required String title,
    required String subtitle,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: () {
        if (isActive) Get.to(() => const LuckyDetailView());
        if (!isActive) Get.to(() => const EndApplicationDetails());
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
                        'NEW',
                        style: TextStyle(
                          color: Color(0xFF9d7aff),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Star icon
                  Positioned(
                    top: 16,
                    right: 16,
                    child: GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AppImages.favourite,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFFffc506), // Change to your desired color
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),

                  // Product image
                  Center(
                    child: SizedBox(
                      width: 120.w,
                      height: 120.h,

                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
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
                  Text(title, style: AppTextStyles.bodytitlesmall),
                  const SizedBox(height: 8),
                  Text(subtitle, style: AppTextStyles.bodySubtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for dot pattern background
class DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.3)
      ..style = PaintingStyle.fill;

    const double dotRadius = 2.0;
    const double spacing = 20.0;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), dotRadius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
