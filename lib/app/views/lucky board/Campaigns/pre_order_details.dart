import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class PreOrderDetails extends StatefulWidget {
  const PreOrderDetails({super.key});

  @override
  State<PreOrderDetails> createState() => _PreOrderDetailsState();
}

class _PreOrderDetailsState extends State<PreOrderDetails> {
  bool isExpanded = false;
  String selectedValue = '1';
  bool val = true;
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
              '지금 예약하면, 혜택이 두 배!\n'
              ' 스타듀밸리 모바일 사전예약하고 선물 받자!',
              style: AppTextStyles.detailsLargeTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              '사전예약만 해도 티켓 지급!\n공식 런칭 시 푸짐한 게임 내 보상도 함께!',
              style: AppTextStyles.detailsSubTitle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Image.asset(AppImages.valleyImage),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RadioMenuButton(
                  value: '1',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.blackAppleIcon),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(AppIcons.iosIcon),
                    ],
                  ),
                ),
                RadioMenuButton(
                  value: '2',
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                  child: SvgPicture.asset(AppIcons.androidIcon),
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('성함', style: AppTextStyles.dialogueTitleText),
                  SizedBox(height: 15.h),
                  Container(
                    height: 56,
                    width: 305,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: AppColors.borderColor,
                      ),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '성함을 입력해주세요',
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text('휴대폰 번호', style: AppTextStyles.dialogueTitleText),
                  SizedBox(height: 15.h),
                  Container(
                    height: 56,
                    width: 305,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: AppColors.borderColor,
                      ),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        suffixIcon: Container(
                          margin: const EdgeInsets.only(top: 5, right: 5),
                          height: 10,
                          width: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.appDownloadButtonColor,
                          ),
                          child: const Center(
                            child: Text(
                              '인증',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: '휴대폰번호를 입력해주세요',
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.appDownloadButtonColor,
                        value: val,
                        onChanged: (value) {
                          setState(() {
                            val = value!;
                          });
                        },
                      ),
                      Text('개인정보수집동의', style: AppTextStyles.dialogueTitleText),
                      SizedBox(width: 25.w),
                      Text('약관보기', style: AppTextStyles.underLineText),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
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
                    '본티 앱 다운로드',
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
                            '상단 [사전예약 하러가기] 버튼을 클릭하면 사전예약 됩니다.',
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
                            '푸짐한 보상이 기다리고 있어요:',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
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
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            '희귀 씨앗 패키지',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
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
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            '특별한 펫 ‘무지개 닭’',
                            style: AppTextStyles.detailsText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
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
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            '초보 농장 스타트팩',
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
                      '🎯 사전예약만 해도 티켓 6장!',
                      style: AppTextStyles.bodyTitleMedium,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: Text(
                      '👇 친구와 함께 인기 앱 런칭을 미리 찜하세요!',
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
                          '이벤트 링크를 공유하고',
                          style: AppTextStyles.detailContainerText,
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          '📩 유효 공유 시, 티켓 1장 받기!',
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
                          '🔵 3단계: 나도 사전예약하고 참여하기',
                          style: AppTextStyles.detailsTitleText,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '나도 해당 앱을 사전예약하면',
                          style: AppTextStyles.detailContainerText,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          '🎁 티켓 6장 추가로 받기!',
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
                            '유효 공유 및 미션 완료 시 티켓이 자동 적립됩니다.',
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
                            '본 광고는 외부 브랜드(스타듀밸리)의 유료 콘텐츠로 제공됩니다.',
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
                            '버튼 클릭 시 앱스토어(또는 플레이스토어)로 이동합니다.',
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
                            '앱 설치 및 사용 관련 문의는 스타듀밸리 고객센터로 부탁드립니다.',
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
                            '럭플은 앱 콘텐츠 및 서비스 운영에 대한 책임을 지지 않습니다.',
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
