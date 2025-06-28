import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermUseScreen extends StatelessWidget {
  TermUseScreen({super.key});
  final List<String> terms = [
    "제1조 (목적)\n이 약관은 **럭플(이하 “회사”)**가 제공하는 **리워드 캠페인 플랫폼 서비스(이하 “서비스”)**의 이용과 관련하여 회원의 권리, 의무, 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.",
    "제2조 (용어의 정의)\n1. 회원: 본 약관에 동의하고 서비스를 이용하는 자\n2. 티켓: 캠페인 참여, 미션 수행 등을 통해 획득하여 이벤트 응모 및 리워드 교환에 사용할 수 있는 가상의 증표\n3. 포인트: 출석 체크, 캠페인 참여 등을 통해 적립되어 리워드와 상품 교환에 사용할 수 있는 가상의 보상\n4. 캠페인: 광고주가 등록한 이벤트, 리워드 제공 활동\n5. 리워드: 티켓 또는 포인트로 교환 가능한 디지털 상품, 기프티콘, 물리적 상품 등",
    "제3조 (약관의 게시 및 개정)\n6. 회사는 본 약관을 서비스 내 화면 또는 별도 링크를 통해 게시합니다.\n7. 회사는 관련 법령을 준수하여 약관을 개정할 수 있으며, 개정 시 공지 후 적용됩니다.",
    "제4조 (서비스 이용)\n8. 회원가입은 14세 이상인 경우에만 가능합니다.\n9. 회원은 1인 1계정만 생성할 수 있습니다.\n10. 회원은 적립한 포인트를 양도하거나 매매를 통해 획득할 수 없습니다.\n11. 회사는 시기적으로 획수 및 계정 이용 제한 가능",
    "제5조 (회원 탈퇴 및 서비스 종료)\n12. 회원은 언제든지 앱 내 마이페이지 > 회원 탈퇴 메뉴를 통해 탈퇴할 수 있습니다.\n13. 탈퇴 시 보유 중인 티켓 및 포인트는 소멸되며, 복구되지 않습니다.",
  ];

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
        title: const Text('이용약관', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                '이용약관',
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: terms.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Text(
                      terms[index],
                      style: const TextStyle(fontSize: 14, height: 1.6),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
