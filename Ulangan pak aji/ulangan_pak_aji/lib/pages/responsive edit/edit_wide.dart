import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/editController.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class Editwide extends StatelessWidget {
  const Editwide({super.key});

  @override
  Widget build(BuildContext context) {
    final dateC = Get.find<DateController>();
    final dropdownC = Get.find<DropDownController>();
    final homeC = Get.find<HomeController>();
    final editC = Get.find<EditTodoController>();

    final args = Get.arguments as Map<String, dynamic>;
    final index = args['index'];
    final todo = args['todo'];

    editC.setTodo(index, todo);
    dropdownC.selectedValue.value = todo.category;
    dateC.dateController.text = editC.formatDate(todo.dueDate);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: AppColors.neon),
        title: const Text(
          "Eddit Activities",
          style: TextStyle(color: AppColors.neon, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SIDE (Title, Desc, Date)
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReuseTextField(
                    label: "Title",
                    controller: editC.titleController,
                    isNUmber: false,
                     fillColor: AppColors.textGrey.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textColor: AppColors.textLight,
                  ),
                  const SizedBox(height: 20),
                  ReuseTextField(
                    label: "Description",
                    controller: editC.descController,
                    isNUmber: false,
                    fillColor: AppColors.textGrey.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textColor: AppColors.textLight,
                  ),
                  const SizedBox(height: 20),
                  ReuseTextField(
                    label: "Due date",
                    controller: dateC.dateController,
                    isNUmber: false,
                    readOnly: true,
                    onTap: () => dateC.pickDate(context),
                     fillColor: AppColors.textGrey.withOpacity(0.2),
                    borderColor: Colors.transparent,
                    textColor: AppColors.textLight,
                  ),
                ],
              ),
            ),

            const SizedBox(width: 40),

            // RIGHT SIDE (Priority, Checkbox, Buttons)
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Priority",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textLight,
                          width: 1.2,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        dropdownColor: AppColors.background,
                        value: dropdownC.selectedValue.value.isEmpty
                            ? todo.category
                            : dropdownC.selectedValue.value,
                        underline: const SizedBox(),
                        icon: const SizedBox(), // no suffix icon
                        style: const TextStyle(color: AppColors.textLight),
                        items: dropdownC.pilihan
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) dropdownC.setSelected(value);
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Obx(
                    () => Row(
                      children: [
                        Checkbox(
                          value: editC.isDone.value,
                          onChanged: (val) {
                            if (val != null) editC.isDone.value = val;
                          },
                          activeColor: AppColors.neon,
                          checkColor: AppColors.background,
                        ),
                        const Text(
                          "is finished",
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      homeC.updateList(
                        index,
                        editC.titleController.text,
                        editC.descController.text,
                        editC.isDone.value,
                        dropdownC.selectedValue.value,
                        dateC.selectedDate.value,
                      );
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neon,
                      foregroundColor: AppColors.background,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Update",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: editC.deleteTodo,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Delete",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
