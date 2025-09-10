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

  final categoryController = TextEditingController();

  String? selectedValue;

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
            
            const SizedBox(height: 12),

            const SizedBox(height: 20),
            Obx(
              () => DropdownButton<String>(
                value: dropdown.selectedValue.value.isEmpty
                    ? null
                    : dropdown.selectedValue.value,
                hint: const Text('Pilih Status'),
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

            CustomButton(
              text: "Save",
              onPressed: () {
                homeController.addList(
                  titleController.text,
                  descController.text,
                 
                  selectedValue ?? "",
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
