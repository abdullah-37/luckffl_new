import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luck_ffle/app/views/home%20screen/home_screen.dart';
import 'package:luck_ffle/app/widgets/points_widget.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class LuckyBoardView extends StatelessWidget {
  const LuckyBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '럭플보드',
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
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom TabBar in body
              TabBar(
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

              // Tab content
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
      ),
    );
  }

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

        _buildProductCard(
          index: 1,
          backgroundColor: const Color(0xFFfde9f5),
          imageUrl:
              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=300&fit=crop',
          title: '네이버플러스 스토어',
          subtitle: '네이버플러스 스토어 사이트 방문 시 티켓 3장 획득!',
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
