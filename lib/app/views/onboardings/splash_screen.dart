import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luck_ffle/app/routes/app_routes.dart';
import 'package:luck_ffle/config/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppPages.walkThrough);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Image.asset(AppIcons.appLogo),
        ),
      ),
    );
  }
}
