import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/views/bottom%20navigation/bottom_navigation.dart';
import 'package:luck_ffle/app/views/profile%20view/settings/term_use_screen.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key});

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  List<Map<String, String>> conditions = [
    {"condition": '(필수) 만 14세 이상'},
    {"condition": '(필수) 럭플 서비스 이용약관'},
    {"condition": '(필수) 개인정보수집 및 이용동의'},
    {"condition": '(선택) 개인정보 마케팅 활용 동의'},
    {"condition": '(선택) 광고성 정보 수신동의'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '럭플이 처음이시군요, \n'
                '약관 동의가 필요해요',
                style: AppTextStyles.bodyTitleExtraLarge,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 13,
                ),
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check,
                      color: AppColors.sliderColor,
                      size: 20,
                    ),
                    SizedBox(width: 20.w),
                    Text('약관 전체 동의', style: AppTextStyles.buttonText),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: ListView.builder(
                  itemCount: conditions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(() => TermUseScreen());
                      },
                      leading: const Icon(
                        Icons.check,
                        color: AppColors.sliderColor,
                        size: 20,
                      ),
                      title: Text(
                        conditions[index]["condition"].toString(),
                        style: AppTextStyles.conditionText,
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: AppColors.checkTextColor,
                      ),
                    );
                  },
                ),
              ),
              // SizedBox(
              //   width: 342.w,
              //   height: 50.h,
              //   child: ElevatedButton(
              //     onPressed: () {
              //       showDialog(
              //         context: context,
              //         builder: (context) {
              //           return const CheckNumberDialogue();
              //         },
              //       );
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
              //     child: Text('동의하기', style: AppTextStyles.buttonText),
              //   ),
              // ),
              CustomElevatedButton(
                onTap: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) {
                  //     return const CheckNumberDialogue();
                  //   },
                  // );
                  Get.offAll(() => const MainScreen());
                },
                title: '동의하기',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
