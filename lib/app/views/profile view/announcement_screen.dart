import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'announcement_detail_screen.dart';

class AnnouncementScreen extends StatelessWidget {
   AnnouncementScreen({super.key});
  final List<Map<String, String>> notices = [
    {
      "title": "[공지] 포인트샵 신규 상품 추가 안내",
      "date": "2023.07.16",
    },
    {
      "title": "[시스템 점검] 4/30(화) 오전 2:00~4:00 서비스 안정화를 위한 점검이 진행됩니다.",
      "date": "2023.07.16",
    },
    {
      "title": "[업데이트] 출석 체크 보상 변경 안내",
      "date": "2023.07.16",
    },
    {
      "title": "[공지] 리워드 지급 정책 변경 안내",
      "date": "2023.07.16",
    },
    {
      "title": "[시스템 점검] 7/15(월) 오전 4:00~5:00",
      "date": "2023.07.16",
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading:  GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios,size: 18,),
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final item = notices[index];
          return ListTile(
            onTap: (){
              Get.to(()=>const AnnouncementDetailScreen());
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            title: Text(
              item['title']!,
              style: const TextStyle(fontSize: 15),
            ),
            subtitle: Text(
              item['date']!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
