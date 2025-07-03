import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:luck_ffle/app/Controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/Controllers/my_points_view_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class MyPointsView extends GetView<MyPointsViewController> {
  const MyPointsView({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController navController = Get.find<BottomNavController>();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left),
          ),
          title: Text('나의 포인트', style: AppTextStyles.bodytitlesmall),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: Constants.horizontalPadding,
              child: Column(
                children: [
                  // Ticket counters section
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFf5f7fa),
                      borderRadius: BorderRadius.circular(800),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,

                      spacing: 10,

                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFD700),

                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              'P',
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Text('1,234', style: AppTextStyles.bodytitlesmall),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {
                            navController.changeIndex(2);
                            Get.back();
                          },
                          title: '포인트 충전',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {
                            Get.toNamed(AppPages.ticketExchangeView);
                          },
                          title: '티켓 교환',
                        ),
                      ),
                    ],
                  ),
                ],
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  color: const Color(0xFFfafafa),

                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Text('최근', style: AppTextStyles.bodyText),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey[600],
                        size: 20.sp,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Container(height: 8.h, color: Colors.grey[100]),

            // TabBarViews for each filter
            Expanded(
              child: TabBarView(
                children: List.generate(3, (_) => _buildTransactionList()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return ListView(
      children: [
        _buildTransactionItem(
          '룰렛 당첨 적립',
          '2024.02.14',
          '+ 30P',
          AppColors.primaryColor,
        ),
        _buildTransactionItem(
          '이벤트 공유 보상',
          '2024.02.14',
          '+100P',
          AppColors.primaryColor,
        ),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 30P', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 60P', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 100P', Colors.red),
        _buildTransactionItem(
          '이벤트 공유 보상',
          '2024.02.14',
          '+ 100P',
          AppColors.primaryColor,
        ),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 80P', Colors.red),
        _buildTransactionItem(
          '이벤트 공유 보상',
          '2024.02.14',
          '+ 100P',
          AppColors.primaryColor,
        ),
      ],
    );
  }
}

Widget _buildTransactionItem(
  String title,
  String date,
  String ticket,
  Color ticketColor,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey[100]!, width: 1)),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.bodytitlesmall),
              const SizedBox(height: 4),
              Text(date, style: AppTextStyles.bodySubtitle),
            ],
          ),
        ),
        if (ticket.isNotEmpty)
          Text(
            ticket,
            style: AppTextStyles.bodytitlesmall.copyWith(color: ticketColor),
          ),
      ],
    ),
  );
}
