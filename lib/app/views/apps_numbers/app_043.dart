import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luck_ffle/app/views/apps_numbers/app_023.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App043 extends StatelessWidget {
  const App043({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFffffff),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CustomElevatedButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const CustomDialuge023(),
              );
            },
            title: "후기 등록",
          ),
        ),
        appBar: AppBar(
          title: const Text('후기 작성'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: Constants.horizontalPadding,
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              children: [
                SizedBox(height: 30.h),
                //
                Image.asset(AppImages.partyingface, height: 60.h),
                Text(
                  textAlign: TextAlign.center,
                  '당첨 후기를 남겨주세요! \n다른 유저에게 응원이 됩니다 :)',
                  style: AppTextStyles.bodytitlesmall,
                ),
                Text(
                  '후기를 남겨주시면 브론즈 티켓을 증정해드려요!',
                  style: AppTextStyles.bodySubtitle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("후기 작성", style: AppTextStyles.bodytitlesmall),
                    Text("0/100", style: AppTextStyles.bodySubtitle),
                  ],
                ),
                const TextField(
                  maxLength: 100,
                  maxLines: 6,
                  minLines: 5,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                    hintText: '최소 10자 이상',
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    counterText: '', // Hides the counter
                    isCollapsed: true, // Reduces internal padding
                  ),
                  style: TextStyle(fontSize: 16),
                ),
                const Divider(),

                // const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
