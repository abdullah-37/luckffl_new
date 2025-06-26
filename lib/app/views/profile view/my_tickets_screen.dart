import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/app_images.dart';
import '../ticket shop/ticket_shop_view.dart';

class TicketScreen extends StatelessWidget {
  final List<Map<String, String>> ticketLogs = [
    {'title': '돌렛 당첨 적립', 'date': '2024.02.14', 'change': '+ 브론즈티켓 1장', 'color': 'orange'},
    {'title': '이벤트 공유 보상', 'date': '2024.02.14', 'change': '+ 실버티켓 3장', 'color': 'orange'},
    {'title': '이벤트 응모', 'date': '2024.02.14', 'change': '-브론즈티켓 1장', 'color': 'red'},
    {'title': '이벤트 응모', 'date': '2024.02.14', 'change': '-브론즈티켓 1장', 'color': 'red'},
    {'title': '이벤트 응모', 'date': '2024.02.14', 'change': '-브론즈티켓 1장', 'color': 'red'},
  ];


  Color getColor(String color) {
    switch (color) {
      case 'orange':
        return const Color(0xffFFD700);
      case 'red':
        return Colors.red;
      default:
        return Colors.black;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios,size: 18,),
        ),
        title: const Text("내 정보", style: TextStyle(fontWeight: FontWeight.w500)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Ticket Counters
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ticketCountBox("브론즈 티켓",Colors.brown, 3),
                ticketCountBox("실버 티켓", Colors.grey, 3),
                ticketCountBox("골드 티켓", Colors.yellow, 3),
              ],
            ),
            const SizedBox(height: 15,),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  actionButton("티켓 충전",(){
                    Get.to(()=>const TicketShopView());
                  }),
                  actionButton("티켓 업그레이드",(){}),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            // Tabs
           const Row(
             spacing: 20,
             children: [
               Text('전체'),
               Text('적립'),
               Text('사용'),
             ],
           ),
            const SizedBox(height: 20,),
            // Dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200
              ),
              child: DropdownButton<String>(
                icon: const Icon(Icons.keyboard_arrow_down_sharp,size: 20,),
                value: "최근",
                items: ["최근"].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                onChanged: (value) {},
                underline: const SizedBox(),
              ),
            ),
            // List
            Expanded(
              child: ListView.builder(
                itemCount: ticketLogs.length,
                itemBuilder: (context, index) {
                  final log = ticketLogs[index];
                  final String title = log['title']!;
                  final String date = log['date']!;
                  final String change = log['change']!;
                  final String colorString = log['color']!;
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(title),
                    subtitle: Text(date,style: const TextStyle(fontSize: 12),),
                    trailing: Text(
                      change,
                      style: TextStyle(
                        color: getColor(colorString),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );

                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ticketCountBox(String label, Color color, int count) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(label, style: const TextStyle(fontSize: 12,color: Colors.grey)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppImages.favourite,
                  colorFilter:  ColorFilter.mode(
                    color,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8,),
                Text('$count', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.red)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButton(String text,void Function()? onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xffFFD700),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
