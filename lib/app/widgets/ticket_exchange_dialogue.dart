import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:luck_ffle/app/widgets/custom_elevated_button.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class TicketExchangeDialog extends StatefulWidget {
  const TicketExchangeDialog({super.key});

  @override
  _TicketExchangeDialogState createState() => _TicketExchangeDialogState();
}

class _TicketExchangeDialogState extends State<TicketExchangeDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 320.w,
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Ticket icon
            SvgPicture.asset(AppImages.favourite, height: 70.h),

            SizedBox(height: 30.h),

            // Title
            Text(
              '실버 티켓으로 교환',
              style: AppTextStyles.bodytitleLarge,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40.h),

            // Points info
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('필요 포인트: ', style: AppTextStyles.bodySubtitle),
                    Text(
                      '1,000P',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('현재 보유 포인트: ', style: AppTextStyles.bodySubtitle),
                    Text(
                      '5,200P',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 40.h),

            // Quantity selector
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (quantity > 1) {
                        setState(() {
                          quantity--;
                        });
                      }
                    },
                    child: Icon(Icons.remove, color: Colors.grey, size: 20.w),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    child: Icon(Icons.add, color: Colors.amber, size: 20.w),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            // Action buttons
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    onTap: () {},
                    title: '나중에',
                    color: const Color(0xFFfafafa),
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(onTap: () {}, title: '나중에'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Function to show the dialog
// void showTicketExchangeDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     barrierDismissible: true,
//     builder: (BuildContext context) {
//       return TicketExchangeDialog();
//     },
//   );
// }
