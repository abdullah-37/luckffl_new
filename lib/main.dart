import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:luck_ffle/app/controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/localization/app_translations.dart';
import 'package:luck_ffle/app/views/apps_numbers/app_036.dart';
import 'package:luck_ffle/config/app_colors.dart';

void main() {
  Get.put(BottomNavController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Use your Figma design size here
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: const Locale('ko', 'KR'),
          fallbackLocale: const Locale('en', 'US'),
          home: const App036(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldcolour,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.scaffoldcolour,
              scrolledUnderElevation: 0,
            ),
          ),
        );
      },
    );
  }
}
