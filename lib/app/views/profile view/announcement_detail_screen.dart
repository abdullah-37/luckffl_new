import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnnouncementDetailScreen extends StatelessWidget {
  const AnnouncementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("공지사항", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left, size: 18),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "[업데이트] 포인트샵 신규 상품 추가 안내",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "2025.04.20",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              ),
              const SizedBox(height: 20),
              const Text(
                "안녕하세요, 럭플입니다! 🎉\n항상 럭플을 이용해주시는 회원님들께 감사드리며,\n더 다양한 혜택을 드리기 위해 포인트샵에 신규 상품이 추가되었습니다!",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Text("🎁 ", style: TextStyle(fontSize: 18)),
                  Text(
                    "추가된 신규 상품 목록",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              _buildBulletPoint("스타벅스 아메리카노 T (4,500P)"),
              _buildBulletPoint("CU 편의점 모바일 상품권 3천원권 (3,000P)"),
              _buildBulletPoint("파리바게뜨 5천원 교환권 (5,000P)"),
              _buildBulletPoint("이디야 카페라떼 (4,000P)"),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Text("📅 ", style: TextStyle(fontSize: 18)),
                  Text(
                    "적용 일정",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                "2025년 4월 21일(월)부터 포인트샵에서 교환 가능",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 24),
              const Text(
                "앞으로도 다양한 리워드와 혜택을 준비할 예정이니 많은 관심 부탁드립니다!\n감사합니다😊\n럭플 운영팀 드림",
                style: TextStyle(fontSize: 14, height: 1.6),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(fontSize: 14)),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}
