import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/splash_screen_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});
  final splashc = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/image/splash.png", width: 150, height: 150),
            const SizedBox(height: 20),
            const Text(
              "Loading...",
              style: TextStyle(color: AppColors.neon, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
//test