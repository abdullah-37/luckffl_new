import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketShopScreen extends StatelessWidget {
  final List<Map<String, dynamic>> packages = [
    {
      'price': '5,000원 패키지',
      'main': '50장',
      'bonus': '+ 5장 (보너스)',
      'silver': '',
      'gold': '',
    },
    {
      'price': '10,000원 패키지',
      'main': '100장',
      'bonus': '+ 12장 (보너스)',
      'silver': '실버티켓 1장',
      'gold': '',
    },
    {
      'price': '30,000원 패키지',
      'main': '300장',
      'bonus': '+ 40장 (보너스)',
      'silver': '실버티켓 4장',
      'gold': '',
    },
    {
      'price': '100,000원 패키지',
      'main': '1000장',
      'bonus': '+ 200장 (보너스)',
      'silver': '실버티켓 12장',
      'gold': '골드티켓 3장',
    },
    {
      'price': '50,000원 패키지',
      'main': '500장',
      'bonus': '+ 80장 (보너스)',
      'silver': '실버티켓 6장',
      'gold': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("티켓샵", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading:  GestureDetector(
          onTap: (){
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios,size: 18,),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description Box
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("티켓은 이벤트 응모에 사용됩니다."),
                SizedBox(height: 4),
                Text("리워드의 티켓 응모수는 이벤트 참여 시 당첨의 확률이 증가합니다."),
                SizedBox(height: 4),
                Text("구매 후 티켓은 즉시 계정에 지급됩니다."),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Filter Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("상품", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: "인기순",
                items: const [
                  DropdownMenuItem(value: "인기순", child: Text("인기순")),
                  DropdownMenuItem(value: "가격순", child: Text("가격순")),
                ],
                onChanged: null, // replace with logic if needed
                underline: const SizedBox(),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Package List
          ...packages.map((pkg) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                // Placeholder Image Box
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(width: 12),
                // Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(pkg['price'], style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Text(pkg['main']),
                          const SizedBox(width: 6),
                          Text(pkg['bonus'], style: TextStyle(color: Colors.red)),
                          if (pkg['silver'] != '') ...[
                            const SizedBox(width: 6),
                            Text(' + ${pkg['silver']}', style: TextStyle(color: Colors.grey.shade700)),
                          ],
                          if (pkg['gold'] != '') ...[
                            const SizedBox(width: 6),
                            Text(' + ${pkg['gold']}', style: TextStyle(color: Colors.grey.shade700)),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
