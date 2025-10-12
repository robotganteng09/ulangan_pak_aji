import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/responsive_controller.dart';
import 'package:ulangan_pak_aji/pages/responsive%20home/home_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20home/home_wide.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final controller = Get.find<ResponsiveController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, Constraints) {
          controller.updatelayout(Constraints);
          return Obx(
            () => controller.ismobile.value ? HomeMobile() : HomeWide(),
          );
        },
      ),
    );
  }
}
