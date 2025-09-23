import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  final dateController = TextEditingController();

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

    // Controllers
    editController = Get.put(EditTodoController());
    homeC = Get.find<HomeController>();
    dropdownc = Get.find<DropDownController>();

    // Set initial values
    editController.setTodo(index, todo);
    selectedValue = todo.category;
    selectedDate = todo.dueDate;

    if (selectedDate != null) {
      dateController.text = DateFormat('d MMMM yyyy').format(selectedDate!);
    }
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return ReuseTextField(
      label: label,
      controller: controller,
      isNUmber: false,
      fillColor: AppColors.textLight,
      borderColor: AppColors.neon,
      textColor: AppColors.background,
      labelColor: AppColors.textGrey,
    );
  }

  Widget _buildButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
    Color textColor = AppColors.background,
  }) {
    return SizedBox(
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
            // Title & Desc
            _buildTextField("Title", editController.titleController),
            const SizedBox(height: 16),
            _buildTextField("Desc", editController.descController),
            const SizedBox(height: 16),

            // Due Date
            TextField(
              controller: dateController,
              readOnly: true,
              onTap: _pickDate,
              decoration: InputDecoration(
                labelText: "Due Date",
                hintText: "d/m/y",
                filled: true,
                fillColor: AppColors.textGrey,
                labelStyle: const TextStyle(color: AppColors.neon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.textLight, width: 2),
                  ),
                ),
                child: DropdownButton<String>(
                  dropdownColor: AppColors.background,
                  value: dropdownc.selectedValue.value.isEmpty
                      ? selectedValue
                      : dropdownc.selectedValue.value,
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
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(color: AppColors.textLight),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => selectedValue = value);
                      dropdownc.setSelected(value);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox
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
            const SizedBox(height: 24),

            // Update Button
            _buildButton(
              text: "Update",
              color: AppColors.textLight,
              textColor: AppColors.background,
              onPressed: () {
                homeC.UpdateList(
                  index,
                  editController.titleController.text,
                  editController.descController.text,
                  editController.isDone.value,
                  selectedValue ?? todo.category,
                  selectedDate,
                );
                Get.back();
              },
            ),
            const SizedBox(height: 12),

            _buildButton(
              text: "Delete",
              color: AppColors.red,
              textColor: AppColors.textLight,
              onPressed: editController.deleteTodo,
            ),
          ],
        ),
      ),
    );
  }
}
