import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:luck_ffle/app/Controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/views/home%20screen/home_screen.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class NewlyOpenedWidget extends StatefulWidget {
  const NewlyOpenedWidget({super.key});

  @override
  State<NewlyOpenedWidget> createState() => _PopularLuckyTopWidgetState();
}

class _PopularLuckyTopWidgetState extends State<NewlyOpenedWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildPopularLucky();
  }

  Widget _buildPopularLucky() {
    BottomNavController navController = Get.find<BottomNavController>();
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
                  Text('🚀 오늘 새로 열린 럭플!', style: AppTextStyles.bodytitleLarge),
                  Text(
                    '가장 최신 이벤트에 먼저 참여해보세요!',
                    style: AppTextStyles.bodySubtitle.copyWith(fontSize: 16.sp),
                  ),
                ],
              ),
            ),

            SizedBox(height: 8.h),

            // Product List
            _buildProductCard(
              index: 0,
              backgroundColor: const Color(0xFFe8eaff),
              imageUrl:
                  'https://images.unsplash.com/photo-1572569511254-d8f925fe2cbb?w=400&h=300&fit=crop',
              title: '아이디어스',
              subtitle: '친구에게 공유하고 티켓 1장 획득!',
            ),

            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: CustomElevatedButton(
                onTap: () {
                  navController.currentIndex.value = 1;
                },
                title: '최신 럭플 더보기',
                color: const Color(0xFFfff6c9),
              ),
            ),
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
  }) {
    return Container(
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
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'New',
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
