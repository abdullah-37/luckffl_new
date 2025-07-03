import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/faq_screen_controller.dart';
import 'package:luck_ffle/config/constants.dart';

class FAQScreen extends GetView<FAQScreenController> {
  final List<Map<String, String>> faqs = [
    {"tag": "티켓/포인트", "question": "출석 체크를 놓쳤는데 포인트 받을 수 있나요?"},
    {
      "tag": "티켓/포인트",
      "question": "티켓 콜렛은 하루 몇 번 돌릴 수 있나요?",
      "subtitle": "티켓 콜렛은 하루 1회 무료로 참여 가능하며, 룰렛 재도전 시 광고 시청 후 추가 참여할 수 있습니다.",
    },
    {"tag": "이벤트", "question": "럭플 이벤트 참여 후 당첨 결과는 언제 알 수 있나요?"},
    {"tag": "티켓/포인트", "question": "포인트는 언제 지급되나요?"},
    {"tag": "계정관리", "question": "탈퇴하면 보유 티켓과 포인트는 어떻게 되나요?"},
  ];

  final List<String> tabs = ["전체", "티켓/포인트", "이벤트", "계정관리", "기타"];

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('자주 묻는 질문', style: TextStyle(color: Colors.black)),
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
          padding: Constants.horizontalPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "궁금한 사항이 있으신가요?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "검색어를 입력해 주세요",
                  hintStyle: const TextStyle(fontSize: 12),
                  filled: true,
                  fillColor: const Color(0xFFF7F7F7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: const Color(0xFFeeeeef),
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(fontSize: 16.sp),
                tabs: tabs.map((t) => Tab(text: t)).toList(),
              ),

              Expanded(
                child: TabBarView(
                  children: [
                    _buildDetailslist(),
                    _buildDetailslist(),
                    _buildDetailslist(),
                    _buildDetailslist(),
                    _buildDetailslist(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailslist() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: faqs.length,
      itemBuilder: (context, index) {
        final faq = faqs[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  faq["tag"] ?? "",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                faq["question"] ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (faq["subtitle"] != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    faq["subtitle"]!,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
