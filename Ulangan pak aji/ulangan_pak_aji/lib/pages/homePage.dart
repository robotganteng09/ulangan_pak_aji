import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/responsive_controller.dart';
import 'package:ulangan_pak_aji/pages/responsive home/home_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive home/home_wide.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  // ✅ Gunakan Get.put agar controller dibuat pertama kali
  final controller = Get.put(ResponsiveController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // ✅ huruf kecil “constraints” (bukan Constraints)
          controller.updatelayout(constraints);
          return Obx(
            () => controller.ismobile.value
                ? const HomeMobile() // tambahkan const
                : const HomeWide(), // tambahkan const
          );
        },
      ),
    );
  }
}
