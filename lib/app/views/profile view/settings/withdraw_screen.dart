import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  String? _selectedReason;
  final TextEditingController _otherReasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원 탈퇴'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left, size: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('😢', style: TextStyle(fontSize: 24)),
                SizedBox(width: 8),
                Text(
                  '정말 탈퇴하시겠어요?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '회원 탈퇴 시 다음 정보가 모두 삭제되며 복구가 불가능합니다.',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            const Text(
              '• 보유 중인 티켓 및 포인트',
              style: TextStyle(color: Colors.grey),
            ),
            const Text('• 캠페인 참여 이력', style: TextStyle(color: Colors.grey)),
            const Text('• 경품 수령 내역', style: TextStyle(color: Colors.grey)),
            const Text('• 출석미션 등 참여 기록', style: TextStyle(color: Colors.grey)),
            const Text('• 포인트샵 구매 내역', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),
            const Text(
              '계정을 삭제하려는 이유가 궁금해요',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildReasonOption('앱 사용이 불편해요'),
            _buildReasonOption('보상이 기대보다 적어요'),
            _buildReasonOption('콘텐츠가 부족해요'),
            _buildReasonOption('상품 종류가 적어요'),
            _buildReasonOption('기타'),
            if (_selectedReason == '기타') ...[
              const SizedBox(height: 8),
              TextField(
                controller: _otherReasonController,
                maxLines: 1,
                decoration: const InputDecoration(
                  hintText: '계정을 삭제하려는 이유를 알려주세요.',
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
            ],
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffFFD700),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Handle withdrawal
                },
                child: const Text(
                  '탈퇴하기',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildReasonOption(String reason) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedReason = reason;
        });
      },
      child: Row(
        children: [
          Expanded(child: Text(reason)),
          Radio<String>(
            value: reason,
            groupValue: _selectedReason,
            activeColor: Colors.yellow,
            onChanged: (value) {
              setState(() {
                _selectedReason = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
