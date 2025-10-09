import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class AddtodoWide extends StatefulWidget {
  const AddtodoWide({super.key});

  @override
  State<AddtodoWide> createState() => _AddPageState();
}

class _AddPageState extends State<AddtodoWide> {
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
      ),
      body: Center(
        child: Container(
          width: 450, // Lebar card agar tampil "wide"
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          padding: const EdgeInsets.all(
            30,
          ), // DITINGKATKAN padding di dalam kartu
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.neon.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 2,
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReuseTextField(
                  label: "Title",
                  controller: homeController.titleController,
                  isNUmber: false,
                  fillColor: Colors.white,
                  borderColor: Colors.transparent,
                  textColor: Colors.black,
                  labelColor: Colors.white,
                ),
                ReuseTextField(
                  label: "Desc",
                  controller: homeController.descController,
                  isNUmber: false,
                  fillColor: Colors.white,
                  borderColor: Colors.transparent,
                  textColor: Colors.black,
                  labelColor: Colors.white,
                  marginTop: 30, // DITINGKATKAN jarak antar field
                ),
                ReuseTextField(
                  label: "Due Date", // Label diubah agar sesuai gambar
                  controller: dateC.dateController,
                  isNUmber: false,
                  readOnly: true,
                  onTap: () => dateC.pickDate(context),
                  hintText: "d/m/y",
                  fillColor: Colors.white,
                  borderColor: Colors.transparent,
                  textColor: Colors.black,
                  labelColor: Colors.white,
                  marginTop: 30, // DITINGKATKAN jarak antar field
                ),
                Obx(
                  () => Container(
                    margin: const EdgeInsets.only(
                      top: 30,
                    ), // DITINGKATKAN jarak sebelum dropdown
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: dropdown.selectedValue.value.isEmpty
                          ? null
                          : dropdown.selectedValue.value,
                      hint: const Text(
                        "Pilih Kategori",
                        style: TextStyle(color: Colors.black),
                      ),
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      items: dropdown.pilihan
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() => selectedValue = value);
                          dropdown.setSelected(value);
                        }
                      },
                    ),
                  ),
                ),

                // Jarak sebelum tombol "Add" (DITINGKATKAN dari 40 ke 60)
                const SizedBox(height: 60),

                Center(
                  // Menghilangkan SizedBox(width: 120) untuk membuat tombol melebar penuh (sesuai gambar)
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.neon,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          12,
                        ), // Border radius disesuaikan
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                      ), // Padding vertikal tombol ditingkatkan
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ), // Memaksa tombol melebar penuh
                      elevation: 0, // Hilangkan shadow bawaan tombol
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
                        color: Colors.black,
                        fontSize: 20, // Ukuran font tombol ditingkatkan
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Jarak setelah tombol "Add" (untuk memberikan ruang di bagian bawah SingleChildScrollView)
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
