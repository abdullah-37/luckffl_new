import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'points_widget.dart'; // Make sure this is the correct path

class AppbarWithPoints extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWithPoints({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.keyboard_arrow_left),
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
          child: PointsWidget(),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
