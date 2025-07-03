import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/app_036_controller.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
// ignore: depend_on_referenced_packages
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class App036 extends GetView<App036Controller> {
  const App036({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: const AppbarWithPoints(),
        body: Column(
          children: [
            // PageView Banner Section
            _buildBannerSection(pageController),
            SizedBox(height: 10.h),

            // Tab Section
            TabBar(
              isScrollable: false,
              tabAlignment: TabAlignment.fill,
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
                Tab(text: '종료'),
              ],
            ),
            // Content List
            Expanded(
              child: TabBarView(
                // controller: _tabController,
                children: [
                  _buildListContent(),
                  _buildListContent(),
                  _buildListContent(),
                  _buildListContent(),
                ],
              ),
            ),
          ],
        ),
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
            // onPageChanged: (index) {
            //   setState(() {
            //     _currentPage = index;
            //   });
            // },
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

  Widget _buildTabSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 16.sp),
        tabs: const [
          Tab(text: '진행중'),
          Tab(text: '진행예정'),
          Tab(text: '종료'),
        ],
      ),
    );
  }

  Widget _buildContentList() {
    return TabBarView(
      // controller: _tabController,
      children: [
        _buildListContent(),
        _buildListContent(),
        _buildListContent(),
        _buildListContent(),
      ],
    );
  }

  Widget _buildListContent() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(16),

          child: Row(
            children: [
              // Profile Image
              SizedBox(
                width: 50,
                height: 50,
                // decoration: BoxDecoration(
                //   color: Colors.grey[200],
                //   borderRadius: BorderRadius.circular(25),
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    'https://picsum.photos/100/100?random=${index + 10}',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: Icon(
                          Icons.person,
                          color: Colors.grey[400],
                          size: 30,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Content
              const Expanded(
                child: Text(
                  '맥세이프케이스 미션참여 적립',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),

              // Action Button
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF3CD),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  '참여',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8B7A00),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
