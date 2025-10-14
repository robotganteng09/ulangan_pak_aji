import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/responsive_controller.dart';
import 'package:ulangan_pak_aji/pages/responsive%20profile/profile_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20profile/profile_wide.dart';

class Profillepage extends StatelessWidget {
  Profillepage({super.key});

  final controller = Get.find<ResponsiveController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, Constraints) {
          controller.updatelayout(Constraints);
          return Obx(
            () => controller.ismobile.value ? ProfilleMobile() : ProfileWide(),
          );
        },
      ),
    );
  }
}
