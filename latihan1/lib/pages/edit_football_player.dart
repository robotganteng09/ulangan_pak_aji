import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/player_edit_controller.dart';
import 'package:latihan1/widgets/widgetcomponents.dart'; // <-- your ReuseTextField, CustomButton file

class EditPlayerPage extends StatelessWidget {
  const EditPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final int index = Get.arguments;
    final EditPlayerController controller = Get.put(
      EditPlayerController(index),
    );

    final nameController = TextEditingController(text: controller.name);
    final positionController = TextEditingController(text: controller.position);
    final numberController = TextEditingController(
      text: controller.number.toString(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ReuseTextField(
              label: "Name",
              controller: nameController,
              isNUmber: false,
              onTap: () {},
            ),
            ReuseTextField(
              label: "Position",
              controller: positionController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Number",
              controller: numberController,
              isNUmber: true,
            ),
            CustomButton(
              text: "Save",
              onPressed: () {
                controller.name = nameController.text;
                controller.position = positionController.text;
                controller.number =
                    int.tryParse(numberController.text) ?? controller.number;
                controller.saveChanges();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
