import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class ContactUsMsgScreen extends StatefulWidget {
  const ContactUsMsgScreen({super.key});

  @override
  State<ContactUsMsgScreen> createState() => _ContactUsMsgScreenState();
}

class _ContactUsMsgScreenState extends State<ContactUsMsgScreen> {
  String? inquiryType;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  bool smsSelected = false;
  bool emailSelected = false;

  Widget _buildBottomSheetItem(String text) {
    return ListTile(
      title: Text(text),
      onTap: () {
        // Handle item selection, e.g. set inquiryType
        Navigator.pop(context);
      },
    );
  }

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
        title: const Text('문의하기', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // 문의 유형
            const Text('문의 유형', style: TextStyle()),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,

                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 10.h),
                          Container(
                            height: 5,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFF757575),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(20),
                            children: [
                              Text(
                                '문의 유형',
                                style: AppTextStyles.bodytitlesmall,
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                '회원/계정',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '이벤트 관련',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '티켓/포인트',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '앱 오류/버그',
                                style: TextStyle(fontSize: 15),
                              ),
                              const SizedBox(height: 12),
                              const Text('기타', style: TextStyle(fontSize: 15)),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('문의 유형을 선택해주세요', style: TextStyle(color: Colors.grey)),
                    Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('제목', style: TextStyle()),
                Text(
                  '0/50',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLines: 1,
              decoration: InputDecoration(
                hintText: '문의 유형을 선택해주세요',
                hintStyle: TextStyle(fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.1),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('내용', style: TextStyle()),
                Text(
                  '0/500',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
            // 제목
            const SizedBox(height: 10),
            const TextField(
              maxLines: 5,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Colors.grey, width: 0.1),
                ),
              ),
            ),
            // 사진 첨부
            const SizedBox(height: 10),
            const Text('사진 첨부'),
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "최대 10장, 10MB미만의 이미지만 첨부할 수 있어요.",
                  hintStyle: const TextStyle(fontSize: 10),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text(
                        '0/10',
                        style: TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 답변 알림 수신 여부
            const Text('답변 알림 수신 여부'),
            Row(
              children: [
                Transform.scale(
                  scale: 1.0, // Adjust scale if you want smaller checkbox
                  child: Checkbox(
                    value: smsSelected,
                    activeColor: Colors.yellow,
                    checkColor: Colors.black, // checkmark color inside yellow
                    side: const BorderSide(
                      color: Colors.grey,
                    ), // border color when unchecked
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.yellow; // when checked
                      }
                      return Colors.white; // when unchecked
                    }),
                    onChanged: (val) {
                      setState(() {
                        smsSelected = val ?? false;
                      });
                    },
                  ),
                ),

                const Text('SMS'),
                Transform.scale(
                  scale: 1.0, // Adjust scale if you want smaller checkbox
                  child: Checkbox(
                    value: emailSelected,
                    activeColor: Colors.yellow,
                    checkColor: Colors.black, // checkmark color inside yellow
                    side: const BorderSide(
                      color: Colors.grey,
                    ), // border color when unchecked
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return Colors.yellow; // when checked
                      }
                      return Colors.white; // when unchecked
                    }),
                    onChanged: (val) {
                      setState(() {
                        emailSelected = val ?? false;
                      });
                    },
                  ),
                ),

                const Text('E-Mail'),
              ],
            ),

            const SizedBox(height: 30),

            // 등록 버튼
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  '등록',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
