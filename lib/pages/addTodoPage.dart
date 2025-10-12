import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String? selectedValue;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();

    final homeController = Get.find<HomeController>();
    final dropdown = Get.find<DropDownController>();
    final dateC = Get.find<DateController>();

    homeController.clearForm();
    dateC.clear();
    dropdown.selectedValue.value = "";
    selectedValue = null;
    selectedDate = null;
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dropdown = Get.find<DropDownController>();
    final dateC = Get.find<DateController>();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReuseTextField(
              label: "Title",
              controller: homeController.titleController,
              isNUmber: false,
              fillColor: AppColors.background,
              borderColor: AppColors.neon,
              textColor: AppColors.textLight,
              labelColor: AppColors.neon,
            ),

            ReuseTextField(
              label: "Desc",
              controller: homeController.descController,
              isNUmber: false,
              fillColor: AppColors.background,
              borderColor: AppColors.neon,
              textColor: AppColors.textLight,
              labelColor: AppColors.neon,
              marginTop: 20,
            ),

            ReuseTextField(
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
              marginTop: 20,
            ),

            Container(
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
                      dropdown.pilihan.contains(dropdown.selectedValue.value) &&
                          dropdown.selectedValue.value.isNotEmpty
                      ? dropdown.selectedValue.value
                      : null,
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
                    dropdown.setSelected(value ?? '');
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
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
                    homeController.titleController.text,
                    homeController.descController.text,
                    selectedValue ?? "",
                    dateC.selectedDate.value,
                  );

                  homeController.clearForm();

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
          ],
        ),
      ),
    );
  }
}
