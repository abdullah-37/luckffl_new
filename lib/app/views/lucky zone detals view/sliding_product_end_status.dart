import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class SlidingProductEndStatus extends StatefulWidget {
  const SlidingProductEndStatus({super.key});

  @override
  State<SlidingProductEndStatus> createState() => _EndApplicationDetailsState();
}

class _EndApplicationDetailsState extends State<SlidingProductEndStatus> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          spacing: 5,
          children: [
            Expanded(
              child: CustomElevatedButton(
                onTap: () {
                  Get.toNamed(AppPages.app044);
                },
                title: '당첨 후기 보기',
                color: const Color(0xFFfff6c9),
              ),
            ),
            Expanded(
              child: CustomElevatedButton(
                onTap: () {},
                title: '확인',
                // color: const Color(0xFFfff6c9),
              ),
            ),
          ],
        ),
      ),
      appBar: const AppbarWithPoints(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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

            SizedBox(height: 15.h),
            Text('Hermès Birkin 30', style: AppTextStyles.bodyTitleMedium),
            SizedBox(height: 10.h),
            Text('이벤트가 종료되었습니다.', style: AppTextStyles.bodyTitleMedium),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  _infoRow('판매가 ', '28,000,000원', isLine: true),
                  const Divider(color: Color(0xFFf2f4f6)),

                  _infoRow('현재가', '0원'),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            //
            Text(
              textAlign: TextAlign.center,
              '많은 분들의 참여로 \n최종 가격이\n0원이 되었어요🎉',
              style: AppTextStyles.bodytitleLarge,
            ),
            SizedBox(height: 10.h),

            Text(
              textAlign: TextAlign.center,

              '이벤트 응모대상 10분 추첨 판매\n현재가 0원이여도 이벤트에 응모할 수 있어요',
              style: AppTextStyles.bodySubtitle,
            ),
            SizedBox(height: 40.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('나의 응모 정보', style: AppTextStyles.dialogueTitleText),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('응모 횟수', style: AppTextStyles.detailsTitleText),
                      Text('5,200회', style: AppTextStyles.detailsText),
                    ],
                  ),
                  const Divider(height: 15, color: AppColors.dividerColor),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('당첨 여부', style: AppTextStyles.detailsTitleText),
                      Text(
                        '🥳 축하해요! 당첨 됐어요!',
                        style: AppTextStyles.detailsText,
                      ),
                    ],
                  ),
                  const Divider(height: 15, color: AppColors.dividerColor),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('당첨자 정보', style: AppTextStyles.dialogueTitleText),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('닉네임', style: AppTextStyles.detailsText),
                      Text('응모 횟수', style: AppTextStyles.detailsText),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('@123456', style: AppTextStyles.endDetailsText),
                      Text('5,200회', style: AppTextStyles.endDetailsText),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('@123456', style: AppTextStyles.endDetailsText),
                      Text('5,200회', style: AppTextStyles.endDetailsText),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('@123456', style: AppTextStyles.endDetailsText),
                      Text('5,200회', style: AppTextStyles.endDetailsText),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('@123456', style: AppTextStyles.endDetailsText),
                      Text('5,200회', style: AppTextStyles.endDetailsText),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('@123456', style: AppTextStyles.endDetailsText),
                      Text('5,200회', style: AppTextStyles.endDetailsText),
                    ],
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
            const Divider(thickness: 6, color: AppColors.dividerColor),
            SizedBox(height: 20.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      children: [
                        Text('안내 사항', style: AppTextStyles.dialogueTitleText),
                        SizedBox(width: 10.w),
                        Icon(
                          isExpanded ? Icons.expand_less : Icons.expand_more,
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
                                      margin: const EdgeInsets.only(bottom: 60),
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
            ),
            SizedBox(height: 20.h),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     SizedBox(
            //       height: 50.h,
            //       width: 170.w,

            //       child: ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor: const WidgetStatePropertyAll(
            //             AppColors.endButtonColor,
            //           ),
            //           shape: WidgetStatePropertyAll(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //         onPressed: () {},
            //         child: const Text(
            //           '당첨 후기 보기',
            //           style: TextStyle(
            //             color: AppColors.textColor,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: 50.h,
            //       width: 170.w,
            //       child: ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor: const WidgetStatePropertyAll(
            //             AppColors.sliderColor,
            //           ),
            //           shape: WidgetStatePropertyAll(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //         onPressed: () {},
            //         child: const Text(
            //           '다른 럭플 응모하기',
            //           style: TextStyle(
            //             color: AppColors.textColor,
            //             fontSize: 14,
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 30.h),

            // SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value, {bool isLine = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: AppTextStyles.bodyText.copyWith(
              decoration: isLine
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
