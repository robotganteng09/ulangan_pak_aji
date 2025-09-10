import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';

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

  final Color background = const Color(0xFF161617);
  final Color neon = const Color(0xFFDBFE2C);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final dropdown = Get.find<DropDownController>();

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
      
        title: Text(
          "Add Activities",
          style: TextStyle(color: neon, fontWeight: FontWeight.bold),
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
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Title",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

         
            TextField(
              controller: descController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                labelText: "Desc",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

           
            TextField(
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
                  });
                }
              },
              decoration: InputDecoration(
                labelText: "Due Date",
                hintText: "d/m/y",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

       
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
                child: DropdownButton<String>(
                  dropdownColor: background,
                  value: dropdown.selectedValue.value.isEmpty
                      ? null
                      : dropdown.selectedValue.value,
                  hint: const Text(
                    "Pilih Kategori",
                    style: TextStyle(color: Colors.white),
                  ),
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  items: dropdown.pilihan
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(color: Colors.white),
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
                    backgroundColor: neon,
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
                  child: Text(
                    "Add",
                    style: TextStyle(
                      color: background,
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
