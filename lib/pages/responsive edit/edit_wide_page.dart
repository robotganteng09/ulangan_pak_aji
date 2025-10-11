import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/wide_controller.dart';
import 'package:ulangan_pak_aji/pages/addTodoPage.dart';
import 'package:ulangan_pak_aji/pages/editTodoPage.dart';
import 'package:ulangan_pak_aji/pages/responsive%20add/addTodo_wide.dart';

import 'package:ulangan_pak_aji/pages/responsive%20edit/editWide.dart';

class EditWidePage extends StatelessWidget {
  EditWidePage({super.key});

  final controller = Get.find<WideController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final controller = Get.find<WideController>();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.updateLayout(constraints);
          });

          return Obx(() {
            return controller.isMobile.value ? EditTodoPage() : Editwide();
          });
        },
      ),
    );
  }
}
