import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductBoxScreen extends StatelessWidget {
  const MyProductBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left, size: 18),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text("나의 상품함"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "럭플에서 당첨 및 교환한\n상품을 확인하세요!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Tabs
          const Row(
            spacing: 20,
            children: [Text('전체'), Text('적립'), Text('사용')],
          ),
          const SizedBox(height: 10),
          Expanded(child: buildItemsGrid(context)),
        ],
      ),
    );
  }

  Widget buildItemsGrid(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16),
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
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                imageUrl,
                height: 140,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(brand, style: const TextStyle(fontSize: 12)),
                  backgroundColor: const Color(0xffFFF6C9),
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  side: BorderSide.none,
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(date, style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
