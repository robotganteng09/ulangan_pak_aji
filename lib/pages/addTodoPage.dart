import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';

class AddPage extends StatefulWidget {
  AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  String? selectedValue;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dropdown = Get.find<DropDownController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Todo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),

            // Dropdown
            Obx(
              () => DropdownButton<String>(
                value: dropdown.selectedValue.value.isEmpty
                    ? null
                    : dropdown.selectedValue.value,
                hint: const Text('Pilih Kategori'),
                items: dropdown.pilihan
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
                    dropdown.setSelected(value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),

            // Date picker
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate != null
                        ? "Due Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : "No due date selected",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.redAccent,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: const Text("Pilih Tanggal"),
                ),
              ],
            ),
            const SizedBox(height: 20),

            CustomButton(
              text: "Save",
              onPressed: () {
                homeController.addList(
                  titleController.text,
                  descController.text,
                  selectedValue ?? "",
                  selectedDate,
                );
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
