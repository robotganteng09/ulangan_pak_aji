import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  String? selectedValue; //Menyimpan kategori dipilih
  DateTime? selectedDate; //Menyimpan tanggal
  final dateController = TextEditingController(); //Controller tanggal

  //Controller variabel todo
  late EditTodoController editController;
  late HomeController homeC;
  late DropDownController dropdownc;
  late int index; // index todo di list
  late dynamic todo; // data todo yang diedit

  @override
  void initState() {
    super.initState();

    //data dari Get.arguments (dikirim dari halaman sebelumnya)
    final args = Get.arguments as Map<String, dynamic>;
    index = args['index'];
    todo = args['todo'];

    //Inisialisasi controller
    editController = Get.put(EditTodoController());
    homeC = Get.find<HomeController>();
    dropdownc = Get.find<DropDownController>();

    // Set data awal ke form
    editController.setTodo(index, todo);
    selectedValue = todo.category;
    selectedDate = todo.dueDate;

    //Format tanggal
    if (selectedDate != null) {
      dateController.text =
          "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
    }
  }

  //Fungsi memilih tanggal menggunakan date picker
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000), //tanggal awal
      lastDate: DateTime(2100), // tanggal akhir
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  // Widget custom untuk textfield
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

  // Widget custom untuk button
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
            // Input Judul
            _buildTextField("Title", editController.titleController),
            const SizedBox(height: 16),

            // Input Deskripsi
            _buildTextField("Desc", editController.descController),
            const SizedBox(height: 16),

            // Input Due Date (hanya bisa dipilih, tidak diketik manual)
            TextField(
              controller: dateController,
              readOnly: true, // supaya tidak bisa diketik manual
              onTap: _pickDate, // buka date picker saat ditekan
              decoration: InputDecoration(
                labelText: "Due Date",
                hintText: "d/m/y",
                filled: true,
                fillColor: AppColors.textLight,
                labelStyle: const TextStyle(color: AppColors.neon),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dropdown kategori
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
                  // Mapping pilihan kategori dari controller
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
                      dropdownc.setSelected(value); // simpan kategori
                    }
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox untuk status "sudah selesai"
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: editController.isDone.value, // binding reactive
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

            // Tombol Update
            _buildButton(
              text: "Update",
              color: AppColors.textLight,
              textColor: AppColors.background,
              onPressed: () {
                // update data todo di HomeController
                homeC.UpdateList(
                  index,
                  editController.titleController.text,
                  editController.descController.text,
                  editController.isDone.value,
                  selectedValue ?? todo.category,
                  selectedDate,
                );
                Get.back(); // kembali ke halaman sebelumnya
              },
            ),
            const SizedBox(height: 12),

            // Tombol Delete
            _buildButton(
              text: "Delete",
              color: AppColors.red,
              textColor: AppColors.textLight,
              onPressed: editController.deleteTodo, // hapus todo
            ),
          ],
        ),
      ),
    );
  }
}
