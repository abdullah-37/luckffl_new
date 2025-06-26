import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/app_images.dart';

class MyPointsScreenScreen extends StatelessWidget {
  final List<Map<String, String>> ticketLogs = [
    {'title': '돌렛 당첨 적립', 'date': '2024.02.14', 'change': '+ 30P', 'color': 'orange'},
    {'title': '이벤트 공유 보상', 'date': '2024.02.14', 'change': '+ 30P', 'color': 'orange'},
    {'title': '이벤트 응모', 'date': '2024.02.14', 'change': '-4,500P ', 'color': 'red'},
    {'title': '이벤트 응모', 'date': '2024.02.14', 'change': '+300P', 'color': 'orange'},
    {'title': '이벤트 응모', 'date': '2024.02.14', 'change': '+300P', 'color': 'orange'},
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
        title: const Text("나의 포인트", style: TextStyle(fontWeight: FontWeight.w500)),
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
            const SizedBox(height: 10,),
            // Top Points Counters
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 37,
                width: 112,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height:25,
                      width:25,
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFD700),

                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          'P',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8,),
                    const Text('1234', style: TextStyle( fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15,),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  actionButton("포인트 충전"),
                  actionButton("티켓 교환"),
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
                        fontSize: 16,
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

  Widget actionButton(String text) {
    return Expanded(
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
    );
  }
}
