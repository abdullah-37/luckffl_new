import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/views/home%20screen/home_screen.dart';
import 'package:luck_ffle/app/views/lucky%20board/lucky_board.dart';
import 'package:luck_ffle/app/views/point%20shop/point_shop_view.dart';
import 'package:luck_ffle/app/views/profile%20view/profile_view.dart';
import 'package:luck_ffle/app/views/rewards%20view/rewards_view.dart';
import 'package:luck_ffle/app/widgets/guiding_widget.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find<BottomNavController>();

    final List<Widget> screens = [
      const HomeScreen(),
      const LuckyBoardView(),
      const RewardsView(),
      const PointsScreen(),
      const ProfileView(),
    ];

    final iconPaths = [
      AppImages.home,
      AppImages.ticket,
      AppImages.gift,
      AppImages.pointshop,
      AppImages.profile,
    ];

    final labels = ['홈', '럭플보드', '혜택', '포인트샵', '마이페이지'];

    return Obx(
      () => Stack(
        fit: StackFit.expand,
        children: [
          Scaffold(
            body: screens[controller.currentIndex.value],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(0, -2),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                backgroundColor: AppColors.scaffoldcolour,
                currentIndex: controller.currentIndex.value,
                onTap: controller.changeIndex,
                selectedLabelStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                unselectedItemColor: const Color(0xFFb0b8c1),
                items: List.generate(5, (index) {
                  final isSelected = controller.currentIndex.value == index;
                  return BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      iconPaths[index],
                      height: 24.h,
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? const Color(0xFFFFD700)
                            : const Color(0xFFb0b8c1),
                        BlendMode.srcIn,
                      ),
                    ),
                    label: labels[index],
                  );
                }),
              ),
            ),
          ),
          if (!controller.isGuidingFinished.value) const GuidingWidget(),
        ],
      ),
    );
  }
}
