import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});

  final titleController = TextEditingController();
  final descController = TextEditingController();
  final categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: categoryController,
              decoration: const InputDecoration(labelText: "Category"),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "Save",
              onPressed: () {
                homeController.addList(
                  titleController.text,
                  descController.text,
                  categoryController.text,
                );
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
