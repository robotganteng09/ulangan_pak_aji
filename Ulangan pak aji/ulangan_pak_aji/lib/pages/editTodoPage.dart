import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/editController.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String? selectedValue;
  DateTime? selectedDate;

  late DateController dateC;
  late EditTodoController editController;
  late HomeController homeC;
  late DropDownController dropdownc;
  late int index;
  late dynamic todo;

  @override
  void initState() {
    super.initState();

    final args = Get.arguments as Map<String, dynamic>;
    index = args['index'];
    todo = args['todo'];

    //Controllers
    editController = Get.put(EditTodoController());
    homeC = Get.find<HomeController>();
    dropdownc = Get.find<DropDownController>();
    dateC = Get.find<DateController>();

    //Set values
    editController.setTodo(index, todo);
    selectedValue = todo.category;
    selectedDate = todo.dueDate;

    if (selectedDate != null) {
      dateC.dateController.text = editController.formatDate(selectedDate);
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: ReuseTextField(
        label: label,
        controller: controller,
        isNUmber: false,
        fillColor: AppColors.background,
        borderColor: AppColors.neon,
        textColor: AppColors.textLight,
        labelColor: AppColors.neon,
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
    Color textColor = AppColors.background,
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) {
    return Container(
      margin: margin,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "Edit Activities",
          style: TextStyle(color: AppColors.neon, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildTextField("Title", editController.titleController),
            _buildTextField("Desc", editController.descController),

            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: ReuseTextField(
                label: "Due Date",
                controller: dateC.dateController,
                isNUmber: false,
                readOnly: true,
                onTap: () => dateC.pickDate(context),
                hintText: "d/m/y",
                fillColor: AppColors.background,
                borderColor: AppColors.neon,
                textColor: AppColors.textLight,
                labelColor: AppColors.neon,
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Obx(
                () => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.neon, width: 2),
                    ),
                  ),
                  child: Obx(
                    () => DropdownButton<String>(
                      dropdownColor: AppColors.background,
                      value:
                          dropdownc.pilihan.contains(
                            dropdownc.selectedValue.value,
                          )
                          ? dropdownc.selectedValue.value
                          : null, // ✅ hindari value tidak ada di list
                      hint: const Text(
                        "Pilih Kategori",
                        style: TextStyle(color: AppColors.textLight),
                      ),
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textLight,
                      ),
                      items: dropdownc.pilihan
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: AppColors.textLight,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        dropdownc.setSelected(value ?? '');
                      },
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: editController.isDone.value,
                      onChanged: (value) {
                        if (value != null) {
                          editController.isDone.value = value;
                        }
                      },
                      activeColor: AppColors.neon,
                      checkColor: AppColors.background,
                    ),
                  ),
                  const Text(
                    "Sudah",
                    style: TextStyle(color: AppColors.textLight),
                  ),
                ],
              ),
            ),

            _buildButton(
              text: "Update",
              color: AppColors.textLight,
              textColor: AppColors.background,
              onPressed: () {
                homeC.updateList(
                  index,
                  editController.titleController.text,
                  editController.descController.text,
                  editController.isDone.value,
                  selectedValue ?? todo.category,
                  dateC.selectedDate.value,
                );
                Get.back();
              },
            ),

            _buildButton(
              text: "Delete",
              color: AppColors.red,
              textColor: AppColors.textLight,
              margin: const EdgeInsets.only(top: 12),
              onPressed: editController.deleteTodo,
            ),
          ],
        ),
      ),
    );
  }
}
