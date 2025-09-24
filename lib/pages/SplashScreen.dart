import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/splash_screen_controller.dart';

class Splashscreen extends StatelessWidget {
  Splashscreen({super.key});
  final splashc = Get.find<SplashScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(child: Text("Splash Screen"))),
    );
  }
}
