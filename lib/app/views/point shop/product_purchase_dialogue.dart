import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/point%20shop/app_042.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class ProductPurchaseDialogue extends StatefulWidget {
  const ProductPurchaseDialogue({super.key});

  @override
  State<ProductPurchaseDialogue> createState() =>
      _ProductPurchaseDialogueState();
}

class _ProductPurchaseDialogueState extends State<ProductPurchaseDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 282,
        width: 280,

        child: Column(
          children: [
            SvgPicture.asset(AppIcons.pIcon, height: 60),
            Text('교환을 진행할까요?', style: AppTextStyles.dialogueTitleText),
            SizedBox(height: 15.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: '필요 포인트 :', style: AppTextStyles.checkText),
                  const TextSpan(
                    text: ' 100',
                    style: TextStyle(color: AppColors.suffixTextColor),
                  ),
                  TextSpan(text: '개', style: AppTextStyles.checkText),
                ],
              ),
            ),
            SizedBox(height: 8.h),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: ' 보유 포인트 :', style: AppTextStyles.checkText),
                  const TextSpan(
                    text: ' 135',
                    style: TextStyle(color: AppColors.suffixTextColor),
                  ),
                  TextSpan(text: '개', style: AppTextStyles.checkText),
                ],
              ),
            ),
            SizedBox(height: 45.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        AppColors.purchaseButtonColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: const Text(
                      '아니요',
                      style: TextStyle(
                        color: AppColors.purchaseTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  height: 40.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.to(() => const App042());
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        AppColors.buttonColor,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text('네', style: AppTextStyles.buttonText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
