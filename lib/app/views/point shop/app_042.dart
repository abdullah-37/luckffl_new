import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/views/bottom%20navigation/bottom_navigation.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_text_styles.dart';
import 'package:luck_ffle/config/constants.dart';

class App042 extends StatelessWidget {
  const App042({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavController navController = Get.find<BottomNavController>();
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(
        title: const Text('교환 완료'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),

      body: Padding(
        padding: Constants.horizontalPadding,
        child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            // image
            const CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(Icons.check, color: Colors.white),
            ),
            //text
            Text('🎉 교환이 완료되었습니다!', style: AppTextStyles.bodytitlesmall),
            // container image
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 238, 238, 238),
              ),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      height: 120.h,
                      width: 100.w,
                      'https://picsum.photos/400/200?random=1',
                      fit: BoxFit.cover,
                    ),
                  ),
                  //
                  Text('스타벅스 아이스아메리카노 Tall', style: AppTextStyles.bodyText),
                  Text('2025.07.14 15:42', style: AppTextStyles.bodySubtitle),
                ],
              ),
            ),

            //
            Text(
              '💡 안내사항  \n본 상품은 문자로 발송됩니다. /n 마이페이지 > 포인트 교환 내역에서 언제든지 확인할 수 있어요.',

              style: AppTextStyles.bodySubtitle,
            ),
            const Spacer(),
            CustomElevatedButton(
              onTap: () {
                navController.currentIndex.value = 3;
                Get.offAll(() => const MainScreen());
              },
              title: "완료",
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
