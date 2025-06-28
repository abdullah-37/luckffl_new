import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class VisitTypeDetails extends StatefulWidget {
  const VisitTypeDetails({super.key});

  @override
  State<VisitTypeDetails> createState() => _VisitTypeDetailsState();
}

class _VisitTypeDetailsState extends State<VisitTypeDetails> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithPoints(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(AppImages.colaImage),
                Positioned(
                  top: 25,
                  left: 30,
                  child: SvgPicture.asset(
                    height: 26,
                    AppImages.favourite,
                    colorFilter: const ColorFilter.mode(
                      AppColors.colaFavourite,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text('스타벅스 아이스아메리카노 Tall', style: AppTextStyles.bodyTitleMedium),
            SizedBox(height: 10.h),
            Text('04: 07: 13  남음', style: AppTextStyles.bodyTitleMedium),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('응모기간', style: AppTextStyles.detailsTitleText),
                      Text(
                        '25.04.21 10:00 ~ 2025.04.27 20:00',
                        style: AppTextStyles.detailsText,
                      ),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('결과발표', style: AppTextStyles.detailsTitleText),
                      Text(
                        '25.04.27 20:00 이후',
                        style: AppTextStyles.detailsText,
                      ),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('당첨인원', style: AppTextStyles.detailsTitleText),
                      Text('10명', style: AppTextStyles.detailsText),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('내 응모 수', style: AppTextStyles.detailsTitleText),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImages.favourite,
                            colorFilter: const ColorFilter.mode(
                              AppColors.colaFavourite,
                              BlendMode.srcIn,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: '2',
                                  style: TextStyle(
                                    color: AppColors.suffixTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: '회 / 전체 128,432회',
                                  style: AppTextStyles.detailsText,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(color: AppColors.dividerColor, height: 20.h),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              '본티를 소개합니다 \n'
              '지구를 위한 일상 속 작은 변화',
              style: AppTextStyles.detailsLargeTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              '생활 속 불필요한 플라스틱을 줄이는\n 본티의 친환경 루틴을 지금 만나보세요 🌿',
              style: AppTextStyles.detailsSubTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Image.asset(AppImages.vonteeImage),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 52,
                width: 313,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.appDownloadButtonColor,
                ),
                child: Center(
                  child: Text(
                    '본티 방문하기',
                    style: AppTextStyles.appDownloadButtonText,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              height: 32.h,
              width: 335.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.dividerColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 28,
                    width: 106,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('참여방법', style: AppTextStyles.selectedTabText),
                    ),
                  ),
                  Container(
                    height: 28,
                    width: 106,
                    decoration: BoxDecoration(
                      color: AppColors.dividerColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '참여방법',
                        style: AppTextStyles.unSelectedTabText,
                      ),
                    ),
                  ),
                  Container(
                    height: 28,
                    width: 106,
                    decoration: BoxDecoration(
                      color: AppColors.dividerColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '참여방법',
                        style: AppTextStyles.unSelectedTabText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('참여방법', style: AppTextStyles.dialogueTitleText),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 25),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '이벤트 페이지를 공유하거나 응모 버튼을 눌러 참여해 주세요.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '상단 [본티 홈페이지 방문하기] 버튼을 클릭하면 브랜드 스토리와 제품 철학을 소개하는 페이지로 이동합니다.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 25),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '고체치약, 제로웨이스트 키트, 정기구독 등 다양한 정보를 확인하실 수 있습니다.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text('공유하기', style: AppTextStyles.dialogueTitleText),
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      '🎯 링크만 눌러도 티켓 4장!',
                      style: AppTextStyles.bodyTitleMedium,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: Text(
                      '👇 클릭 한 번이면 경품 찬스 도전 완료!',
                      style: AppTextStyles.detailsText,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    height: 127.h,
                    width: 319,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.detailContainerColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '🟢 1단계: 이벤트 공유하기',
                          style: AppTextStyles.detailsTitleText,
                        ),

                        Text(
                          '이벤트 링크를 친구에게 보내고',
                          style: AppTextStyles.detailContainerText,
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          '📩 유효 공유 시 티켓 1장 적립!',
                          style: AppTextStyles.detailContainerText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    height: 127.h,
                    width: 319,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.detailContainerColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '🟡 2단계: 친구가 이벤트 열어보기',
                          style: AppTextStyles.detailsTitleText,
                        ),

                        Text(
                          '친구가 앱에서 해당 이벤트를 확인하면',
                          style: AppTextStyles.detailContainerText,
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          '👥 친구 + 나, 둘 다 티켓 1장씩 더 획득!',
                          style: AppTextStyles.detailContainerText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    height: 127.h,
                    width: 319,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.detailContainerColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '🔵 3단계: 나도 사이트 방문하고 참여하기',
                          style: AppTextStyles.detailsTitleText,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '나도 해당 웹사이트에 방문하면',
                          style: AppTextStyles.detailContainerText,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '🎁 티켓 4장 추가 지급!',
                          style: AppTextStyles.detailsTitleText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text('✅ 꼭 확인하세요', style: AppTextStyles.detailContainerText),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '하루에 한 이벤트는 3명에게만 공유할 수 있어요.',
                          style: AppTextStyles.detailsText,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '친구가 이벤트를 앱에서 열어볼 경우에만 티켓이 지급됩니다.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '유효 공유 및 미션 완료 시 티켓이 자동 적립됩니다',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '티켓은 럭플 찬스, 티켓픽 등에서 바로 사용할 수 있어요.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text('유의사항', style: AppTextStyles.dialogueTitleText),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '본 광고는 외부 브랜드(본티)의 유료 콘텐츠로 제공됩니다.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '버튼 클릭 시외부 웹사이트(사전예약 페이지)로 연결됩니다.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '사전예약 및 상품 관련 문의는 본티 고객센터를 통해 접수해 주세요.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          height: 5.h,
                          width: 5.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.checkTextColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            '럭플은 사전예약 및 상품 배송에 대한 책임을 지지 않습니다.',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Row(
                          children: [
                            Text(
                              '안내 사항',
                              style: AppTextStyles.dialogueTitleText,
                            ),
                            SizedBox(width: 10.w),
                            Icon(
                              isExpanded
                                  ? Icons.expand_less
                                  : Icons.expand_more,
                              color: AppColors.checkTextColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        child: isExpanded
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '경품 응모 및 추첨 관련 유의사항',
                                    style: AppTextStyles.checkText,
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '티켓 1장 = 응모 1회 기준이며, 응모 횟수가 많을수록 당첨 확률이 상승합니다.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '추첨은 응모 마감일 기준으로 진행되며, 추첨 결과는 앱 알림 또는 SMS로 개별 안내됩니다',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 40,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '공유하기를 통해 타인이 캠페인에 참여 시 티켓이 추가 적립됩니다. 단, 자신의 계정으로 반복 참여 시 보상 지급이 제한될 수 있습니다',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  Text(
                                    '리워드(경품) 지급 관련 유의사항',
                                    style: AppTextStyles.checkText,
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '경품은 추첨 후 7일 이내 지급됩니다.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '기프티콘 등 디지털 경품은 앱 내 나의 상품함에 발급되며, 유효기간 내 미사용 시 자동 소멸됩니다.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 60,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '물리적 상품(택배 발송)은 회원가입 시 등록된 정보 기준으로 발송되며, 주소 오류, 수령 불가 등 회원 책임 사유로 인한 배송 문제는 재발송 또는 보상이 불가합니다.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '경품은 동등 가치의 다른 상품으로 대체될 수 있습니다.(변경 시 별도 안내 예정)',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30.h),
                                  Text(
                                    '쿠폰 발급 및 사용 관련 유의사항',
                                    style: AppTextStyles.checkText,
                                  ),
                                  SizedBox(height: 10.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 40,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '쿠폰(기프티콘 포함)의 경우,발급일로부터 유효기간 내 사용 가능하며, 기간 만료 시 연장 또는 환불이 불가합니다.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '쿠폰 사용처 및 사용 방법은 제공처의 정책을 따릅니다.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                            bottom: 20,
                                          ),
                                          height: 5.h,
                                          width: 5.w,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.checkTextColor,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Text(
                                            '쿠폰 발급 완료 후에는 교환, 환불, 변경이 불가하오니 신중히 선택해 주세요.',
                                            style: AppTextStyles.detailsText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.h,
                  width: 170.w,

                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        AppColors.detailButtonColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '공유하기',
                      style: TextStyle(
                        color: AppColors.suffixTextColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: 170.w,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        AppColors.suffixTextColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      '응모하기',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
