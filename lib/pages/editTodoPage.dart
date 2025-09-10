import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';
import 'package:ulangan_pak_aji/controller/editController.dart';

class EditTodoPage extends StatefulWidget {
  const EditTodoPage({super.key});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  String? selectedValue;
  DateTime? selectedDate;

  final Color background = const Color(0xFF161617);
  final Color neon = const Color(0xFFDBFE2C);

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final int index = args['index'];
    final dynamic todo = args['todo'];

    final editController = Get.put(EditTodoController());
    final homeC = Get.find<HomeController>();
    final dropdownc = Get.find<DropDownController>();

    // set awal
    editController.setTodo(index, todo);
    selectedValue = todo.category;
    selectedDate = todo.dueDate;

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        elevation: 0,
      
        title: Text(
          "Edit Activities",
          style: TextStyle(color: neon, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
       
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Title
            ReuseTextField(
              label: "Title",
              controller: editController.titleController,
              isNUmber: false,
              fillColor: Colors.white,
              borderColor: neon,
              textColor: Colors.black,
              labelColor: Colors.black54,
            ),
            const SizedBox(height: 16),

            // Desc
            ReuseTextField(
              label: "Desc",
              controller: editController.descController,
              isNUmber: false,
              fillColor: Colors.white,
              borderColor: neon,
              textColor: Colors.black,
              labelColor: Colors.black54,
            ),
            const SizedBox(height: 16),

            // Due Date
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

            // Dropdown
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
                  value: dropdownc.selectedValue.value.isEmpty
                      ? selectedValue
                      : dropdownc.selectedValue.value,
                  hint: const Text(
                    "Pilih Kategori",
                    style: TextStyle(color: Colors.white),
                  ),
                  isExpanded: true,
                  underline: const SizedBox(),
                  icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                  items: dropdownc.pilihan
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
                    activeColor: neon,
                  ),
                ),
                const Text("Sudah", style: TextStyle(color: Colors.white)),
              ],
            ),

            const SizedBox(height: 24),

            // Update Button (putih)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
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
                child: const Text(
                  "Update",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Delete Button (merah)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: editController.deleteTodo,
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
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
