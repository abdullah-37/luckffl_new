import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/profile%20view/update_nickname_screen.dart';

class MyInfoScreen extends StatelessWidget {
  const MyInfoScreen({super.key});

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
        title: const Text(
          "내 정보",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              // Section Header
              const ListTile(
                leading: Icon(Icons.shield, color: Colors.grey),
                title: Text(
                  "내 정보",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),

              // Name
              _buildInfoRow(() {}, "이름", "홍길동"),
              const Divider(),

              // Nickname
              _buildInfoRow(
                () {
                  Get.to(() => const NicknameChangeScreen());
                },
                "닉네임",
                "@1234567",
                showArrow: true,
              ),
              const Divider(),

              // 가입 수단
              _buildInfoRow(() {}, "가입 수단", "네이버 가입"),
              const Divider(),

              // Email
              _buildInfoRow(() {}, "이메일", "qwer12@naver.com"),
              const Divider(),

              // Phone number
              _buildInfoRow(() {}, "휴대폰 번호", "010-1234-1234", showArrow: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(
    void Function()? onTap,
    String label,
    String value, {
    bool showArrow = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            Expanded(child: Text(label, style: const TextStyle(fontSize: 16))),
            Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            if (showArrow) const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
