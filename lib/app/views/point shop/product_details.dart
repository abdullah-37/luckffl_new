import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:luck_ffle/app/Controllers/product_details_controller.dart';
import 'package:luck_ffle/app/views/point%20shop/product_purchase_dialogue.dart';
import 'package:luck_ffle/app/widgets/appbar_with_points.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class ProductDetails extends GetView<ProductDetailsController> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWithPoints(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImages.colaImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    width: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: AppColors.endButtonColor,
                    ),
                    child: Center(
                      child: Text('스타벅스', style: AppTextStyles.bodyText),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    '스타벅스 아이스아메리카노 Tall',
                    style: AppTextStyles.bodyTitleMedium,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.pIcon),
                      SizedBox(width: 10.w),
                      Text('16,000', style: AppTextStyles.detailsLargeTitle),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 20,
              thickness: 6,
              color: AppColors.dividerColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('▶상품설명', style: AppTextStyles.checkText),
                  SizedBox(height: 5.h),
                  Text(
                    '- 스타벅스의 깔끔한 맛을 자랑하는 커피로, 스타벅스 파트너들이 가장 좋아하는 커피입니다.',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 20.h),
                  Text('▶유의사항', style: AppTextStyles.checkText),
                  SizedBox(height: 5.h),
                  Text(
                    '- 상기 이미지는 연출된 것으로 실제와 다를 수 있습니다.',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 본 상품은 매장 재고 상황에 따라 동일 상품으로 교환이 불가능할 수 있습니다.',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 동일 상품 교환이 불가한 경우 다른 상품으로 교환이 가능합니다. (차액 발생 시 차액 지불)',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 상품 결제 시 본 상품 권면에 기재된 금액의 60% 이상을 결제한 후 남은 잔액은 회원의 계정에'
                    ' 등록된 스타벅스 카드나 보유하고 있는 무기명 스타벅스 카드에 충전됩니다. 스타벅스 카드를 '
                    '등록 또는 보유하고 있지 않은 고객의 경우,'
                    ' 무기명 스타벅스 카드를 발급받아 잔액을 충전할 수 있습니다. (일부 매장 잔액 적립 불가)',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 스타벅스 앱의 사이렌 오더를 통해서도 주문 및 결제가 가능합니다. (일부 MD제외)',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 미군부대 매장, 워터파크 입점 매장 등 일부 매장에서는 사용이 불가합니다.',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 해당 쿠폰과 스타벅스 카드의 복합결제 거래는 스타벅스 카드의 고유 혜택인 Free Extra'
                    ' 및 별 적립은 적용 대상이 아닌 점 이용에 참고하시기 바랍니다.',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 정식 판매처 외의 장소나 경로를 통하여 구매하거나, 기타의 방법으로 보유하신 '
                    '쿠폰은 정상적인 사용 (환불, 재전송 등 포함)이 금지되거나 제한될 수 있으니 주의하시기 바랍니다.',
                    style: AppTextStyles.checkText,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    '- 본 상품은 스타벅스 어플 홈 > Coupon > 모바일 상품권에 추가해 편리하게 사용하실 수 있습니다.',
                    style: AppTextStyles.checkText,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: 320.w,
            //   height: 50.h,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // showDialog(
            //       //   context: context,
            //       //   builder: (context) => App13Dialogue(),
            //       // );
            //     },
            //     style: ButtonStyle(
            //       backgroundColor: const WidgetStatePropertyAll(
            //         AppColors.buttonColor,
            //       ),
            //       shape: WidgetStatePropertyAll(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10),
            //         ),
            //       ),
            //     ),
            //     child: Text('교환하기', style: AppTextStyles.buttonText),
            //   ),
            // ),
            Padding(
              padding: Constants.horizontalPadding,
              child: CustomElevatedButton(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProductPurchaseDialogue(),
                  );
                },
                title: '교환하기',
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
