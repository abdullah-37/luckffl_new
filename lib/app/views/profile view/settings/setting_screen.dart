import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
        title: const Text('설정', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard([
            _buildSwitchTile('럭플 활동 알림', false),
            _buildSwitchTile('광고/마케팅 알림', true),
          ]),
          const SizedBox(height: 12),
          _buildCard([
            _buildNavItem('이용약관'),
            _buildNavItem('개인정보처리방침'),
            _buildNavItem('전자금융거래 이용약관'),
            _buildNavItem('마케팅 수신 동의'),
          ]),
          const SizedBox(height: 12),
          _buildCard([
            _buildNavItem('문의하기', icon: Icons.headphones),
          ]),
          const SizedBox(height: 12),
          _buildCard([
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.grey),
              title: const Text('앱 버전 1.5.17'),
              subtitle: const Text('최신 버전입니다.', style: TextStyle(fontSize: 12)),
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 12),
          _buildButton('로그아웃', onPressed: () {}),
          const SizedBox(height: 8),
          _buildButton('탈퇴하기', onPressed: () {}, isDestructive: true),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSwitchTile(String title, bool value) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: (_) {},
      activeColor: Colors.yellow[700],
    );
  }

  Widget _buildNavItem(String title, {IconData? icon}) {
    return ListTile(
      leading: icon != null ? Icon(icon, color: Colors.grey) : null,
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed, bool isDestructive = false}) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: isDestructive ? Colors.red : Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
