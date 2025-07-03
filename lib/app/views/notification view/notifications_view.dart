import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:luck_ffle/app/Controllers/notifications_view_controller.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class NotificationsView extends GetView<NotificationsViewController> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('알림', style: AppTextStyles.bodytitlesmall),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        actions: [
          Row(
            children: [
              //
              const Icon(Icons.check, color: Colors.black, size: 18),
              Text('모두 읽음', style: AppTextStyles.bodyText),
            ],
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: const NotificationTimelineWidget(),
    );
  }
}

class NotificationTimelineWidget extends StatelessWidget {
  const NotificationTimelineWidget({super.key});

  final List<Map<String, String>> notifications = const [
    {
      'title': '출석 도장 찍고 티켓 받아가세요!',
      'subtitle': '오늘도 출석하면 티켓 1장 추가 지급 🎫',
      'time': '49분전',
    },
    {
      'title': '티켓 룰렛 돌릴 시간이에요!',
      'subtitle': '오늘의 행운을 놓치지 마세요! 🎡',
      'time': '7월 21일',
    },
    {
      'title': '새로운 럭플 캠페인이 오픈됐어요!',
      'subtitle': '놓치지 말고 바로 참여해보세요! 🔥',
      'time': '7월 21일',
    },
    {
      'title': '새로운 럭플 캠페인이 오픈됐어요!',
      'subtitle': '놓치지 말고 바로 참여해보세요! 🔥',
      'time': '7월 21일',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics:
          const NeverScrollableScrollPhysics(), // optional: disable scroll if parent scrolls
      shrinkWrap: true,
      itemCount: notifications.length,
      separatorBuilder: (_, __) => SizedBox(height: 40.h),
      itemBuilder: (context, index) {
        final item = notifications[index];
        return _buildNotificationItem(
          title: item['title'] ?? '',
          subtitle: item['subtitle'] ?? '',
          timeAgo: item['time'] ?? '',
        );
      },
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String subtitle,
    required String timeAgo,
  }) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFfff9f2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Yellow star icon in circle
          SvgPicture.asset(AppImages.notifications),

          SizedBox(width: 15.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(title, style: AppTextStyles.bodytitlesmall),
                    ),
                    Text(timeAgo, style: AppTextStyles.bodySubtitle),
                  ],
                ),

                SizedBox(height: 8.h),

                Text(subtitle, style: AppTextStyles.bodySubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
