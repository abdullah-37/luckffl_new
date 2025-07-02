import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({super.key});
  final List<Map<String, dynamic>> inquiries = [
    {
      "status": "답변대기",
      "title": "참여한 이벤트가 종료됐는데 당첨 결과가 안 와요",
      "date": "2023.07.16",
      "category": "이벤트 관련",
      "answered": false,
    },
    {
      "status": "답변완료",
      "title": "출석 체크했는데 포인트가 적립되지 않았어요",
      "date": "2023.07.16",
      "category": "티켓/포인트",
      "answered": true,
      "content":
          "1:1문의 내용 텍스트 영역입니다. 1:1문의 내용 텍스트 영역입니다. 1:1문의 내용 텍스트 영역입니다. 1:1문의 내용 텍스트 영역입니다. 1:1문의 내용 텍스트 영역입니다.",
      "images": [
        "https://picsum.photos/400/200?random=1",
        "https://picsum.photos/400/200?random=2",
      ],
      "reply":
          "안녕하세요, 고객님\n회원님께서 문의하신 내용에 대한 답변입니다. 질문 남겨주셔서 감사합니다. 확인 부탁드립니다!",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFffffff),
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.keyboard_arrow_left, size: 18),
          ),
          title: const Text('문의하기', style: TextStyle(color: Colors.black)),
          backgroundColor: const Color(0xFFffffff),
          elevation: 0,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          bottom: const TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            dividerColor: Color(0xFFfafafa),
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontSize: 16),
            tabs: [
              Tab(text: '전체문의 3'),
              Tab(text: '답변완료 2'),
              Tab(text: '답변대기 1'),
            ],
          ),
        ),
        body: TabBarView(children: List.generate(3, (_) => buildInquiryList())),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomElevatedButton(
            onTap: () {
              Get.toNamed(AppPages.contactUsMsgScreen);
            },
            title: '문의하기',
          ),
        ),
      ),
    );
  }

  Widget buildInquiryList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: inquiries.length,
      itemBuilder: (context, index) {
        final item = inquiries[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (item['answered'] == false)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    item['status'],
                    style: const TextStyle(fontSize: 10),
                  ),
                ),
              const SizedBox(height: 8),
              if (item['answered'] == false)
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              const SizedBox(height: 4),

              if (item['answered'] == false)
                Text(
                  '${item['date']} | ${item['category']}',
                  style: AppTextStyles.bodySubtitle,
                ),

              // const Divider(),
              if (item['answered'] == true) ...[
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFF6C9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('답변완료', style: TextStyle(fontSize: 10)),
                ),
                const SizedBox(height: 12),
                Text(
                  item['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  item['content'],
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                Row(
                  children: item['images']
                      .map<Widget>(
                        (url) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              url,
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    item['reply'] ?? '',
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item['date'] + ' | ' + item['category'],
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
