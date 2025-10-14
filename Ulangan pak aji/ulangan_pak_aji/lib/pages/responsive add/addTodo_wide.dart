import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/cardReusable.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class AddtodoWide extends StatelessWidget {
  const AddtodoWide({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dropdown = Get.find<DropDownController>();
    final dateC = Get.find<DateController>();

    // Reset state ketika halaman dibuka
    homeController.clearForm();
    dateC.clear();
    dropdown.selectedValue.value = "";

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.neon),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Add Activities",
          style: TextStyle(
            color: AppColors.neon,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row: Title + Priority
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title field
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Title",
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(top: 6)),
                        ReuseTextField(
                          label: 'judul',
                          controller: homeController.titleController,
                          isNUmber: false,
                          fillColor: AppColors.background,
                          borderColor: AppColors.neon,
                          textColor: AppColors.textLight,
                        ),
                      ],
                    ),
                  ),

                  // Jarak antar kolom pakai Container
                  Container(width: 20),

                  // Priority dropdown
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Priority",
                          style: TextStyle(
                            color: AppColors.textLight,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(margin: const EdgeInsets.only(top: 6)),
                        Obx(
                          () => Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              border: Border.all(
                                color: AppColors.neon,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButton<String>(
                              value: dropdown.selectedValue.value.isEmpty
                                  ? null
                                  : dropdown.selectedValue.value,
                              hint: const Text(
                                "Select",
                                style: TextStyle(color: AppColors.textLight),
                              ),
                              isExpanded: true,
                              underline: const SizedBox(),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.neon,
                              ),
                              dropdownColor: AppColors.background,
                              items: dropdown.pilihan
                                  .map(
                                    (item) => DropdownMenuItem(
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
                                if (value != null) {
                                  dropdown.setSelected(value);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Jarak antar bagian pakai Container margin
              Container(margin: const EdgeInsets.only(top: 25)),

              // Description
              const Text(
                "Description",
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(margin: const EdgeInsets.only(top: 6)),
              ReuseTextField(
                label: 'deskripsi',
                controller: homeController.descController,
                isNUmber: false,
                fillColor: AppColors.background,
                borderColor: AppColors.neon,
                textColor: AppColors.textLight,
              ),

              Container(margin: const EdgeInsets.only(top: 25)),

              const Text(
                "Due date",
                style: TextStyle(
                  color: AppColors.textLight,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(margin: const EdgeInsets.only(top: 6)),
              ReuseTextField(
                label: 'tanggal',
                controller: dateC.dateController,
                isNUmber: false,
                readOnly: true,
                onTap: () => dateC.pickDate(context),
                hintText: "Select date",
                fillColor: AppColors.background,
                borderColor: AppColors.neon,
                textColor: AppColors.textLight,
              ),

              Container(margin: const EdgeInsets.only(top: 30)),

              // Add Button
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: screenWidth * 0.25,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neon,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      homeController.addList(
                        homeController.titleController.text,
                        homeController.descController.text,
                        dropdown.selectedValue.value,
                        dateC.selectedDate.value,
                      );
                      homeController.clearForm();
                      Get.back();
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
