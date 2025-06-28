import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class CheckNumberDialogue extends StatefulWidget {
  const CheckNumberDialogue({super.key});

  @override
  State<CheckNumberDialogue> createState() => _CheckNumberDialogueState();
}

class _CheckNumberDialogueState extends State<CheckNumberDialogue> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.whiteColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 182,
        width: 280,

        child: Column(
          children: [
            Text(
              '이미 [카카오]로 가입된 번호입니다.',
              style: AppTextStyles.dialogueTitleText,
            ),
            SizedBox(height: 15.h),
            Text('기존 로그인 수단으로 로그인해 주세요.', style: AppTextStyles.dialogueText),
            SizedBox(height: 45.h),
            SizedBox(
              width: 248.w,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const CheckNumberDialogue(),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(
                    AppColors.buttonColor,
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text('로그인', style: AppTextStyles.buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
