import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/controller/editController.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final int index = args['index'];
    final dynamic todo = args['todo'];

    final editController = Get.put(EditTodoController());
    final homeC = Get.find<HomeController>();
    final dropdownc = Get.find<DropDownController>();
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

                Obx(
                  () => DropdownButton<String>(
                    value: dropdownc.selectedValue.value.isEmpty
                        ? null
                        : dropdownc.selectedValue.value,
                    hint: const Text('Pilih Status'),
                    items: dropdownc.pilihan
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedValue = value;
                        });
                        dropdownc.setSelected(value);
                        homeC.updateCategory(index, value);
                      }
                    },
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
