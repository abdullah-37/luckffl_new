import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';
import 'package:luck_ffle/app/views/point%20shop/app_042.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 282,

        child: Column(
          spacing: 10,
          children: [
            SvgPicture.asset(AppIcons.pIcon, height: 60),
            Text('교환을 진행할까요?', style: AppTextStyles.dialogueTitleText),
            // SizedBox(height: 15.h),
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
            const Spacer(),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {},
                    title: '아니요',
                    color: const Color(0xFFf4f4f5),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {
                      Get.to(() => const App042());
                    },
                    title: '네',
                    color: const Color(0xFFffd700),
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
