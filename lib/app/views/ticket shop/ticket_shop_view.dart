import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class TicketShopView extends StatefulWidget {
  const TicketShopView({super.key});

  @override
  State<TicketShopView> createState() => _TicketShopViewState();
}

class _TicketShopViewState extends State<TicketShopView> {
  @override
  Widget build(BuildContext context) {
    String selectedOption = '인기순'; // Define this in your stateful widget
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('티켓샵', style: AppTextStyles.bodytitlesmall),
        centerTitle: true,
      ),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            // Header section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '티켓을 구매하고',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  '더 많은 이벤트에 응모해보세요!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      _buildBulletPoint('티켓은 이벤트 응모에 사용됩니다.'),
                      const SizedBox(height: 8),
                      _buildBulletPoint('리워드룰이 높을수록 이벤트 참여 시 당첨의 확률이 증가합니다.'),
                      const SizedBox(height: 8),
                      _buildBulletPoint('구매 후 티켓은 즉시 계정에 지급됩니다.'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Sort section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '상품',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),

                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedOption,
                    items: ['인기순', '가격순', '최신순']
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(
                              option,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedOption = value;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey[600],
                      size: 20,
                    ),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    dropdownColor: Colors.white,
                  ),
                ),
              ],
            ),

            // Divider

            // Package list
            Expanded(
              child: ListView(
                children: [
                  _buildPackageItem(
                    '5,000원 패키지',
                    '50장 +5장 (보너스)',
                    'https://picsum.photos/400/200?random=1',
                  ),
                  _buildPackageItem(
                    '10,000원 패키지',
                    '100장 +12장 (보너스) + 실버티켓 1장',
                    'https://picsum.photos/400/200?random=2',
                  ),
                  _buildPackageItem(
                    '30,000원 패키지',
                    '300장 +40장 (보너스) + 실버티켓 4장',
                    'https://picsum.photos/400/200?random=3',
                  ),
                  _buildPackageItem(
                    '100,000원 패키지',
                    '1000장 +200장 (보너스) + 실버티켓\n12장 + 골드티켓 3장',
                    'https://picsum.photos/400/200?random=4',
                  ),
                  _buildPackageItem(
                    '50,000원 패키지',
                    '500장 +80장 (보너스) + 실버티켓 6장',
                    'https://picsum.photos/400/200?random=5',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 3,
          height: 3,
          margin: const EdgeInsets.only(top: 8, right: 8),
          decoration: BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.circle,
          ),
        ),
        Expanded(child: Text(text, style: const TextStyle(fontSize: 12))),
      ],
    );
  }

  Widget _buildPackageItem(String title, String description, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppPages.buyTicketsView);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Container(
              height: 90.h,
              width: 100.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.network(imageUrl, fit: BoxFit.cover),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  _buildDescriptionText(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionText(String description) {
    List<TextSpan> spans = [];
    RegExp regex = RegExp(r'\+(\d+장 \(보너스\))');

    String remaining = description;
    int lastEnd = 0;

    for (Match match in regex.allMatches(description)) {
      // Add text before the match
      if (match.start > lastEnd) {
        spans.add(
          TextSpan(
            text: description.substring(lastEnd, match.start),
            style: TextStyle(color: Colors.grey[600]),
          ),
        );
      }

      // Add the bonus text in red
      spans.add(
        TextSpan(
          text: '+${match.group(1)}',
          style: const TextStyle(color: Colors.red),
        ),
      );

      lastEnd = match.end;
    }

    // Add remaining text
    if (lastEnd < description.length) {
      spans.add(
        TextSpan(
          text: description.substring(lastEnd),
          style: TextStyle(color: Colors.grey[600]),
        ),
      );
    }

    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: spans.isEmpty
            ? [
                TextSpan(
                  text: description,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ]
            : spans,
        style: const TextStyle(fontSize: 11, height: 1.4),
      ),
    );
  }
}
