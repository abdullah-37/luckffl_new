import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:luck_ffle/app/Controllers/my_tickets_view_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class MyTicketsView extends GetView<MyTicketsViewController> {
  const MyTicketsView({super.key});

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
        body: Column(
          children: [
            Padding(
              padding: Constants.horizontalPadding,
              child: Column(
                children: [
                  // Ticket counters section
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      spacing: 10,
                      children: [
                        _buildTicketCounter('브론즈 티켓', 3, Colors.brown),
                        _buildTicketCounter('실버 티켓', 3, Colors.grey),
                        _buildTicketCounter('골드 티켓', 3, Colors.amber),
                      ],
                    ),
                  ),

                  // Action buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {
                            Get.toNamed(AppPages.ticketShopScreen);
                          },
                          title: '티켓 충전',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomElevatedButton(
                          onTap: () {
                            Get.toNamed(AppPages.ticketUpgradeView);
                          },
                          title: '티켓 업그레이드',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFfafafa),
                      borderRadius: BorderRadius.circular(10),
                    ),

                    // width: 80,
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
          '+ 브론즈티켓 1장',
          Colors.amber,
        ),
        _buildTransactionItem(
          '이벤트 공유 보상',
          '2024.02.14',
          '+ 실버티켓 3장',
          Colors.amber,
        ),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 브론즈티켓 1장', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 브론즈티켓 1장', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 브론즈티켓 1장', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 브론즈티켓 1장', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '- 브론즈티켓 1장', Colors.red),
        _buildTransactionItem('이벤트 응모', '2024.02.14', '', Colors.red),
      ],
    );
  }
}

Widget _buildTicketCounter(String title, int count, Color color) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFfafafa),
      ),
      child: Column(
        children: [
          Text(title, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                AppImages.favourite,
                colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Text(
                count.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildTransactionItem(
  String title,
  String date,
  String ticket,
  Color ticketColor,
) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: const BoxDecoration(
      // border: Border(bottom: BorderSide(color: Colors.grey[100]!, width: 1)),
    ),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
            ],
          ),
        ),
        if (ticket.isNotEmpty)
          Text(
            ticket,
            style: TextStyle(
              fontSize: 14,
              color: ticketColor,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    ),
  );
}
