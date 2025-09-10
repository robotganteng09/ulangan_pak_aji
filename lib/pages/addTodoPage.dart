import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final dateController = TextEditingController();

  String? selectedValue;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dropdown = Get.find<DropDownController>();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: const Text(
          "Add Activities",
          style: TextStyle(color: AppColors.neon, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            TextField(
              controller: titleController,
              style: const TextStyle(color: AppColors.background),
              decoration: InputDecoration(
                labelText: "Title",
                filled: true,
                fillColor: AppColors.textLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Desc
            TextField(
              controller: descController,
              style: const TextStyle(color: AppColors.background),
              decoration: InputDecoration(
                labelText: "Desc",
                filled: true,
                fillColor: AppColors.textLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Due Date
            TextField(
              controller: dateController,
              readOnly: true,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    selectedDate = picked;
                    dateController.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  });
                }
              },
              decoration: InputDecoration(
                labelText: "Due Date",
                hintText: "d/m/y",
                filled: true,
                fillColor: AppColors.textLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

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
                  value: dropdown.selectedValue.value.isEmpty
                      ? null
                      : dropdown.selectedValue.value,
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
                  items: dropdown.pilihan
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
                      setState(() {
                        selectedValue = value;
                      });
                      dropdown.setSelected(value);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Add button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neon,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    homeController.addList(
                      titleController.text,
                      descController.text,
                      selectedValue ?? "",
                      selectedDate,
                    );
                    Get.back();
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(
                      color: AppColors.background,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
