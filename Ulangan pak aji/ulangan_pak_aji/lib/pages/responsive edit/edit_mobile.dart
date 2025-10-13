import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/editcontroller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class EditTodoMobile extends StatefulWidget {
  const EditTodoMobile({super.key});

  @override
  State<EditTodoMobile> createState() => _EditTodoMobileState();
}

class _EditTodoMobileState extends State<EditTodoMobile> {
  late DateController dateC;
  late DropDownController dropdownC;
  late Editcontroller editController;
  late HomeController homeC;

  late int index;
  late Map<String, dynamic> todo;

  @override
  void initState() {
    super.initState();
    dateC = Get.find<DateController>();
    dropdownC = Get.find<DropDownController>();
    editController = Get.put(Editcontroller());
    homeC = Get.find<HomeController>();

    final args = Get.arguments as Map<String, dynamic>;
    index = args['index'];
    todo = args['todo'];

    editController.setTodo(index, todo);
    dropdownC.selectedValue.value = todo['category'] ?? '';
    dateC.dateController.text = editController.formatDate(
      editController.parseDate(todo['dueDate']),
    );
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

            // Due Date Picker
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

            // Dropdown Category
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Obx(
                () => DropdownButton<String>(
                  dropdownColor: AppColors.background,
                  value: dropdownC.selectedValue.value.isNotEmpty
                      ? dropdownC.selectedValue.value
                      : null,
                  hint: const Text(
                    "Pilih Kategori",
                    style: TextStyle(color: AppColors.textLight),
                  ),
                  isExpanded: true,
                  underline: Container(height: 2, color: AppColors.neon),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: AppColors.textLight,
                  ),
                  items: dropdownC.pilihan
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(color: AppColors.textLight),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    dropdownC.setSelected(value ?? '');
                  },
                ),
              ),
            ),

            // Checkbox
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

            // Buttons
            _buildButton(
              text: "Update",
              color: AppColors.textLight,
              textColor: AppColors.background,
              onPressed: () async {
                await editController.updateTodo(
                  category: dropdownC.selectedValue.value,
                  dueDate: dateC.selectedDate.value,
                );
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
