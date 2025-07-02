import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/controllers/login_with_phone_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class PhoneScreen extends GetView<LoginWithPhoneController> {
  const PhoneScreen({super.key});

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
                Text('휴대폰 번호를 입력해주세요.', style: AppTextStyles.bodytitleLarge),
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
                      hintText: '휴대폰번호 입력',
                    ),
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              onTap: () {
                // (() => const PhoneOtpScreen());
                Get.toNamed(AppPages.phoneOtpScreen);
              },
              title: '인증번호 요청',
            ),
          ],
        ),
      ),
    );
  }
}
