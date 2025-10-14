import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/responsive_controller.dart';
import 'package:ulangan_pak_aji/pages/responsive%20edit/edit_Wide.dart';
import 'package:ulangan_pak_aji/pages/responsive%20edit/edit_mobile.dart';

class Edittodopage extends StatelessWidget {
  Edittodopage({super.key});

  final controller = Get.find<ResponsiveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          Future.delayed(Duration.zero, () {
            controller.updatelayout(constraints);
          });

          return Obx(
            () => controller.ismobile.value
                ? const EditTodoMobile()
                : const Editwide(),
          );
        },
      ),
    );
  }
}
