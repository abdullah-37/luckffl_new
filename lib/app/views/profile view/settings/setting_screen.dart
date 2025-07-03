import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/Controllers/setting_screen_controller.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/config/app_colors.dart';
import 'package:luck_ffle/config/app_images.dart';
import 'package:luck_ffle/config/app_text_styles.dart';

class SettingsScreen extends GetView<SettingScreenController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.keyboard_arrow_left, size: 18),
        ),
        title: const Text('설정', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: const Color(0xFFF9F9F9),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCard([
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.notifications)),
                ),
                const SizedBox(width: 10),
                const Text('알림 설정', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            // _buildSwitchTile('럭플 활동 알림', first, (val) {
            //   setState(() {
            //     first = val;
            //   });
            // }),
            // _buildSwitchTile('광고/마케팅 알림', second, (val) {
            //   setState(() {
            //     second = val;
            //   });
            // }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('럭플 활동 알림', style: AppTextStyles.bodyText),
                const CustomToggel(),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('럭플 활동 알림', style: AppTextStyles.bodyText),
                const CustomToggel(),
              ],
            ),
          ]),

          // CupertinoSwitch(value: true, onChanged: (v) {}),
          const SizedBox(height: 12),
          _buildCard([
            Row(
              children: [
                Image.asset(AppImages.lockicon, height: 45),
                const SizedBox(width: 10),
                const Text('약관 및 정책', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            _buildNavItem(() {
              Get.toNamed(AppPages.termUseScreen);
            }, '이용약관'),
            _buildNavItem(() {}, '개인정보처리방침'),
            _buildNavItem(() {}, '전자금융거래 이용약관'),
            _buildNavItem(() {}, '마케팅 수신 동의'),
          ]),
          const SizedBox(height: 12),
          _buildCard([
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.headphones)),
                ),
                const SizedBox(width: 10),
                const Text('고객센터', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            _buildNavItem(() {
              Get.toNamed(AppPages.contactUsScreen);
            }, '문의하기'),
          ]),
          const SizedBox(height: 12),
          _buildCard([
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: Icon(Icons.settings)),
                ),
                const SizedBox(width: 10),
                const Text('앱 정보', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 25),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('앱 버전', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    Text(
                      '1.5.17',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  '최신 버전입니다.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ]),
          const SizedBox(height: 12),
          _buildButton(
            '로그아웃',
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
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
                          // Image or other widgets can go here
                          const Text(
                            '로그아웃 하시겠습니까?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey.shade100,
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      '취소',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 40.h,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffFFD700),
                                      foregroundColor: Colors.black,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: Text(
                                      '로그아웃',
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Get.toNamed(AppPages.withdrawScreen);
            },
            child: const Center(
              child: Text(
                '탈퇴하기',
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCard(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
      activeTrackColor: Colors.yellow,
      inactiveTrackColor: Colors.grey.shade200,
    );
  }

  Widget _buildNavItem(void Function()? onTap, String title, {IconData? icon}) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: icon != null ? Icon(icon, color: Colors.grey) : null,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios_sharp, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildButton(String text, {VoidCallback? onPressed}) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}

class CustomToggel extends StatefulWidget {
  const CustomToggel({super.key});

  @override
  State<CustomToggel> createState() => _CustomToggelState();
}

class _CustomToggelState extends State<CustomToggel> {
  bool isenabled = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isenabled = !isenabled;
        });
      },
      child: SizedBox(
        height: 40,
        width: 55,
        child: Stack(
          children: [
            /// Animated background
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                height: 25,
                width: 55,
                decoration: BoxDecoration(
                  color: isenabled
                      ? AppColors.primaryColor
                      : const Color(0xFFe5e8eb),
                  borderRadius: BorderRadius.circular(1000),
                ),
              ),
            ),

            /// Animated toggle knob
            AnimatedAlign(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: isenabled
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                height: 30,
                width: 30,
                // margin: const EdgeInsets.symmetric(horizontal: 2), // spacing
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isenabled
                        ? AppColors.primaryColor
                        : const Color(0xFFd1d6db),
                    width: 4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
