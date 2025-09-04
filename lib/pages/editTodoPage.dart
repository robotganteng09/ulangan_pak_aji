import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/controller/editController.dart';

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final int index = args['index'];
    final dynamic todo = args['todo'];

    final editController = Get.put(EditTodoController());
    editController.setTodo(index, todo);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Todo")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ReuseTextField(
              label: "Title",
              controller: editController.titleController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Description",
              controller: editController.descController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Category",
              controller: editController.categoryController,
              isNUmber: false,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: editController.isDone.value,
                    onChanged: (value) {
                      if (value != null) {
                        editController.isDone.value = value;
                      }
                    },
                  ),
                ),
                Obx(
                  () => Text(
                    editController.isDone.value ? "Selesai" : "Belum Selesai",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            CustomButton(text: "Update", onPressed: editController.updateTodo),
            CustomButton(
              text: "Delete",
              margin: 12,
              onPressed: editController.deleteTodo,
            ),
          ],
        ),
      ),
    );
  }
}
