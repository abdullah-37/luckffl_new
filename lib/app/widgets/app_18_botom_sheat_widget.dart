import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class App18BotomSheatWidget extends StatelessWidget {
  const App18BotomSheatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.scaffoldcolour,
      height: 600.h,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),

      child: Column(
        spacing: 10,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Center(
            child: Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1000),
                color: const Color(0xFFcdcfd0),
              ),
            ),
          ),
          //
          Text('응모하기', style: AppTextStyles.bodytitleLarge),
          Text('많이 응모할수록 당첨 확률이 높아져요!', style: AppTextStyles.bodytitlesmall),
          SizedBox(height: 5.h),
          Text('응모하기', style: AppTextStyles.bodyText),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              spacing: 10,
              children: [
                _buildTicketCounter('브론즈 티켓', 3, Colors.brown),
                _buildTicketCounter('실버 티켓', 3, Colors.grey),
                _buildTicketCounter('골드 티켓', 3, Colors.amber),
              ],
            ),
          ),
          Text('브론즈 티켓', style: AppTextStyles.bodyText),
          SizedBox(height: 5.h),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFe3e5e5)),
              borderRadius: BorderRadius.circular(1000),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.remove),
                Text(
                  '1',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Icon(Icons.add, color: AppColors.primaryColor),
              ],
            ),
          ),
          SizedBox(height: 5.h),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFfafafa),
              border: Border.all(color: const Color(0xFFf2f4f5)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('나의 응모 현황', style: AppTextStyles.bodyText),

                Text('32회', style: AppTextStyles.bodytitlesmall),
              ],
            ),
          ),
          Text(
            '• 티켓 1장당 1회 응모가 가능하며, 응모 횟수는 이벤트 종료 시 당첨 확률에 영향을 줍니다.\n• 응모 후 티켓은 환불되지 않습니다.',
            style: AppTextStyles.bodySubtitle,
          ),

          //
          const Spacer(),
          CustomElevatedButton(
            onTap: () {},
            title: '응모하기',
            color: const Color(0xFFff2e2e),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildTicketCounter(String title, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFfafafa),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  AppImages.favourite,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ),
                const SizedBox(width: 8),
                Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
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

// class CheckNumberDialogueApp006 extends StatefulWidget {
//   const CheckNumberDialogueApp006({super.key});

//   @override
//   State<CheckNumberDialogueApp006> createState() => _CheckNumberDialogueState();
// }

// class _CheckNumberDialogueState extends State<CheckNumberDialogueApp006> {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: AppColors.whiteColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         height: 182,
//         width: 280,

//         child: Column(
//           children: [
//             Text(
//               '이미 [카카오]로 가입된 번호입니다.',
//               style: AppTextStyles.dialogueTitleText,
//             ),
//             SizedBox(height: 15.h),
//             Text('기존 로그인 수단으로 로그인해 주세요.', style: AppTextStyles.dialogueText),
//             SizedBox(height: 45.h),
//             SizedBox(
//               width: 248.w,
//               height: 40.h,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ButtonStyle(
//                   backgroundColor: const WidgetStatePropertyAll(
//                     AppColors.buttonColor,
//                   ),
//                   shape: WidgetStatePropertyAll(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 child: Text('로그인', style: AppTextStyles.buttonText),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
