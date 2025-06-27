import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class LuckyDetailView extends StatelessWidget {
  const LuckyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Row(
          spacing: 10,
          children: [
            Expanded(
              child: CustomElevatedButton(
                onTap: () {},
                title: '공유하기',
                color: const Color(0xFFffdbdb),
                textColor: const Color(0xFFff2e2e),
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                onTap: () {},
                title: '응모하기',
                color: const Color(0xFFff2e2e),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
      appBar: const AppbarWithPoints(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image with bookmark
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Image.network(
                  'https://picsum.photos/400/200?random=1',
                  width: double.infinity,
                  height: 300.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SvgPicture.asset(AppImages.favourite, height: 25.h),
                ),
              ],
            ),

            // Title & Timer
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Column(
                children: [
                  Text(
                    '스타벅스 아이스아메리카노 Tall',
                    style: AppTextStyles.bodytitleLarge,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '04:07:13 남음',
                    style: AppTextStyles.bodytitleLarge.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Info rows
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  _infoRow('응모기간', '25.04.21 10:00 ~ 2025.04.27 20:00'),
                  _infoRow('결과발표', '25.04.27 20:00 이후'),
                  _infoRow('당첨인원', '10명'),
                  const Divider(),
                  _infoRowWithIcon('내 응모 수', '2회 / 전체 128,432회'),
                  const Divider(),
                ],
              ),
            ),

            SizedBox(height: 8.h),

            // 안내사항
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Text(
                        '안내 사항',
                        style: AppTextStyles.bodytitlesmall.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_up, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    '경품 응모 및 추첨 관련 유의사항\n'
                    'ㆍ티켓 1장 = 응모 1회 기준이며,\n'
                    '  응모 횟수가 많을수록 당첨 확률이 상승합니다.\n'
                    'ㆍ추첨은 응모 마감일 기준으로 진행되며,\n'
                    '  추첨 결과는 앱 알림 또는 SMS로 개별 안내됩니다.\n'
                    'ㆍ공유하기를 통해 타인의 캠페인에 참여 시 티켓이 추가 적립됩니다.\n'
                    '  단, 자신의 계정으로 반복 참여 시 보상 지급이 제한될 수 있습니다.\n\n'
                    '리워드(경품) 지급 관련 유의사항\n'
                    'ㆍ경품은 추첨 후 7일 이내 지급됩니다.\n'
                    'ㆍ기프티콘 등 디지털 경품은 앱 내 나의 상품함에 발급되며,\n'
                    '  유효기간 내 미사용 시 자동 소멸됩니다.\n'
                    'ㆍ물리적 상품(택배 발송)은 회원가입 시 등록된 정보 기준으로 배송됩니다.\n'
                    '  주소 오류, 수령 불가 등 회원 책임 사유로 인한 배송 문제는 재발송 또는 보상이 불가합니다.\n'
                    'ㆍ경품은 동등 가치의 다른 상품으로 대체될 수 있습니다. (변경 시 별도 안내 예정)\n\n'
                    '쿠폰 발급 및 사용 관련 유의사항\n'
                    'ㆍ쿠폰(기프티콘 포함)의 경우,\n'
                    '  발급일로부터 유효기간 내 사용 가능하며,\n'
                    '  기간 만료 시 연장 또는 환불이 불가합니다.\n'
                    'ㆍ쿠폰 사용 및 사용 방법은 제공처의 정책을 따릅니다.\n'
                    'ㆍ쿠폰 발급 완료 후에는 교환, 환불, 변경이 불가하오니 신중히 선택해 주세요.',
                    style: AppTextStyles.bodySubtitle,
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bodytitlesmall),
          Text(value, style: AppTextStyles.bodyText),
        ],
      ),
    );
  }

  Widget _infoRowWithIcon(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.bodytitlesmall),
          Row(
            children: [
              SvgPicture.asset(AppImages.favourite, height: 15.h),
              SizedBox(width: 4.w),
              Text(value, style: AppTextStyles.bodyText),
            ],
          ),
        ],
      ),
    );
  }
}
