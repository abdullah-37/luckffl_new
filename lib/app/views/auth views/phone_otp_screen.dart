import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class PhoneOtpScreen extends StatefulWidget {
  const PhoneOtpScreen({super.key});

  @override
  State<PhoneOtpScreen> createState() => _PhoneOtpScreenState();
}

class _PhoneOtpScreenState extends State<PhoneOtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back(canPop: true);
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('인증코드를 입력해주세요.', style: AppTextStyles.bodytitlesmall),
                SizedBox(height: 25.h),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                          width: 0.2,
                        ),
                      ),
                      hintText: '010-1234-●●●●',
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 50,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.borderColor,
                          width: 0.2,
                        ),
                      ),
                      suffixText: '2:59',
                      suffixStyle: const TextStyle(
                        color: AppColors.suffixTextColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('인증문자가 오지 않나요?', style: AppTextStyles.checkText),
                    Container(
                      height: 30,
                      width: 97,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: AppColors.greyColor,
                      ),
                      child: Center(
                        child: Text(
                          '인증코드 재전송',
                          style: AppTextStyles.bodyTextSmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(
            //   width: 342.w,
            //   height: 50.h,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Get.to(() => TermsAndConditions());
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
            //     child: Text('확인', style: AppTextStyles.buttonText),
            //   ),
            // ),
            CustomElevatedButton(
              onTap: () {
                // (() => const TermsAndConditions());
                Get.toNamed(AppPages.termsAndConditions);
              },
              title: '확인',
            ),
          ],
        ),
      ),
    );
  }
}
