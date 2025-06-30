import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/config/app_colors.dart';

import 'points_widget.dart'; // Make sure this is the correct path

class AppbarWithPoints extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  const AppbarWithPoints({
    super.key,
    this.backgroundColor = AppColors.scaffoldcolour,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(Icons.keyboard_arrow_left),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
          child: PointsWidget(),
        ),
        // SizedBox(width: 10.w),
      ],
    );
  }
}
