import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class BuyTicketScreen extends StatefulWidget {
  const BuyTicketScreen({super.key});

  @override
  _TicketPurchaseScreenState createState() => _TicketPurchaseScreenState();
}

class _TicketPurchaseScreenState extends State<BuyTicketScreen> {
  int quantity = 1;
  String selectedPayment = '카드결제';
  bool isAgreed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left),
        ),
        title: Text('티켓 구매', style: AppTextStyles.bodytitlesmall),
        centerTitle: true,
      ),
      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('상품', style: AppTextStyles.bodytitleLarge),
                    SizedBox(height: 20.h),

                    // Product section
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFfafafa),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '5,000원 패키지',
                                      style: AppTextStyles.bodytitlesmall,
                                    ),
                                    SizedBox(height: 8.h),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '50장 ',
                                            style: AppTextStyles.bodySubtitle,
                                          ),
                                          TextSpan(
                                            text: '+5장 (보너스)',
                                            style: AppTextStyles.bodySubtitle
                                                .copyWith(color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '5,000원',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  _buildQuantitySelector(),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15.h),

                    // Payment method section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('결제수단', style: AppTextStyles.bodytitlesmall),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            _buildPaymentOption('카드결제', true),
                            SizedBox(width: 20.w),
                            _buildPaymentOption('가상계좌', false),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        _buildDropdownField('선택'),
                        SizedBox(height: 12.h),
                        _buildDropdownField('입시불'),
                      ],
                    ),

                    SizedBox(height: 15.h),

                    // Total amount section
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFFfafafa),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('총 결제 금액', style: AppTextStyles.bodytitlesmall),
                          SizedBox(height: 20.h),
                          _buildAmountRow('총 1개의 상품금액', '5,000원'),
                          SizedBox(height: 12.h),
                          _buildAmountRow('부가세 (10%)', '500원'),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('총 합계', style: AppTextStyles.bodytitlesmall),
                              Text(
                                '5,500 원',
                                style: TextStyle(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                    // Agreement section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 24.w,
                          height: 24.w,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16.w,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          '위 구매조건 확인 및 결제진행에 동의',
                          style: AppTextStyles.bodyText,
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),

            // Payment button
            // Container(
            //   color: Colors.white,
            //   padding: EdgeInsets.all(20.w),
            //   child: SizedBox(
            //     width: double.infinity,
            //     height: 56.h,
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.amber,
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(8.r),
            //         ),
            //         elevation: 0,
            //       ),
            //       child: Text(
            //         '결제하기',
            //         style: TextStyle(
            //           fontSize: 18.sp,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            CustomElevatedButton(onTap: () {}, title: '결제하기'),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySelector() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.remove, color: Colors.grey[600], size: 18.w),

          SizedBox(
            width: 30.w,
            child: Text(
              quantity.toString(),
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyText.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(Icons.add, color: Colors.amber, size: 18.w),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String title, bool isSelected) {
    return Row(
      children: [
        Container(
          width: 20.w,
          height: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.amber : Colors.transparent,
            border: Border.all(
              color: isSelected ? Colors.amber : Colors.grey[400]!,
              width: 2,
            ),
          ),
          child: isSelected
              ? Icon(Icons.circle, color: Colors.white, size: 10.w)
              : null,
        ),
        SizedBox(width: 8.w),
        Text(title, style: AppTextStyles.bodyText),
      ],
    );
  }

  Widget _buildDropdownField(String text) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: AppTextStyles.bodySubtitle),
          Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 20.w),
        ],
      ),
    );
  }

  Widget _buildAmountRow(String title, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.bodyText),
        Text(amount, style: AppTextStyles.bodyText),
      ],
    );
  }
}
