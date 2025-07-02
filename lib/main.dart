import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:luck_ffle/app/controllers/bottom_navigation_controller.dart';
import 'package:luck_ffle/app/localization/app_translations.dart';
import 'package:luck_ffle/app/views/lucky%20zone%20detals%20view/sliding_product_in_progress.dart';
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
      designSize: const Size(375, 812),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          translations: AppTranslations(),
          locale: const Locale('ko', 'KR'),
          fallbackLocale: const Locale('en', 'US'),
          home: const SlidingProductInProgress(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.scaffoldcolour,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFffffff),
              scrolledUnderElevation: 0,
            ),
          ),
        );
      },
    );
  }
}
