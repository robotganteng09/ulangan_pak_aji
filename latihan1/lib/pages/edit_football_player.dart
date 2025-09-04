import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/edit_player_controller.dart';
import 'package:latihan1/widgets/widgetcomponents.dart'; // <-- your ReuseTextField, CustomButton

class EditPlayerPage extends StatelessWidget {
  const EditPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ambil index dari arguments
    final int index = Get.arguments;
    final EditPlayerController controller = Get.put(
      EditPlayerController(index),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Player")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //
            ReuseTextField(
              label: "Name",
              controller: controller.nameController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Position",
              controller: controller.positionController,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "Number",
              controller: controller.numberController,
              isNUmber: true,
            ),
            CustomButton(
              text: "Save",
              onPressed: () {
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
