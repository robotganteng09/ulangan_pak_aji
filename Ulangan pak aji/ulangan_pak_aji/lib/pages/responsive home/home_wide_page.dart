import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ulangan_pak_aji/controller/wide_controller.dart';
import 'package:ulangan_pak_aji/pages/homePage.dart';
import 'package:ulangan_pak_aji/pages/responsive%20home/home_wide.dart';

class HomeWidePage extends StatelessWidget {
  HomeWidePage({super.key});

  final controller = Get.find<WideController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(() => controller.isMobile.value ? Homepage() : HomeWide());
        },
      ),
    );
  }
}
