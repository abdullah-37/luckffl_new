import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class MyProductBoxScreen extends StatelessWidget {
  const MyProductBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFffffff),
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          title: Text('나의 티켓', style: AppTextStyles.bodytitlesmall),
          centerTitle: true,
        ),
        body: Padding(
          padding: Constants.horizontalPadding,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '럭플에서 당첨 및 교환한\n상품을 확인하세요!',
                  style: AppTextStyles.bodyTitleExtraLarge,
                ),
              ),

              const SizedBox(height: 8),

              // Filter tabs
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
                  Tab(text: '전체'),
                  Tab(text: '적립'),
                  Tab(text: '사용'),
                ],
              ),

              // Sort dropdown

              // Container(height: 8.h, color: Colors.grey[100]),

              // TabBarViews for each filter
              Expanded(
                child: TabBarView(
                  children: List.generate(
                    3,
                    (_) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: buildItemsGrid(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItemsGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 0.65,
      children: [
        buildItemCard(
          context,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfL3mCN-vuTqFql02jPL7_Exav8FeRVPIaUZeFw85IT-HxPfuorATyYevWh-H7sBM4dJU&usqp=CAU',
          brand: '이디야커피',
          title: '초콜릿 ICED (R)',
          date: '2025.04.01 교환',
          isUsed: true,
        ),
        buildItemCard(
          context,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfL3mCN-vuTqFql02jPL7_Exav8FeRVPIaUZeFw85IT-HxPfuorATyYevWh-H7sBM4dJU&usqp=CAU',
          brand: '투썸플레이스',
          title: '제철 맛온 딸기 라떼 R',
          date: '2025.04.01 당첨',
          isUsed: false,
        ),
      ],
    );
  }

  Widget buildItemCard(
    BuildContext context, {
    required String imageUrl,
    required String brand,
    required String title,
    required String date,
    required bool isUsed,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Stack(
              children: [
                Image.network(
                  imageUrl,
                  // height: 140.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                if (isUsed)
                  Container(
                    // height: 140.h,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.5),
                    ),
                    child: const Center(
                      child: Text(
                        '사용완료',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Chip(
          label: Text(brand, style: const TextStyle(fontSize: 12)),
          backgroundColor: const Color(0xffFFF6C9),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          side: BorderSide.none,
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(date, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
