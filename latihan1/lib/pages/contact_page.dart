import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/contact_controller.dart';

class ContactPage extends StatelessWidget {
  ContactPage({super.key});

  final ContactController controller = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Page")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.nameController,
                    decoration: const InputDecoration(labelText: "Enter Name"),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    controller.addName();
                  },
                  child: const Text("Add"),
                ),
              ],
            ),

            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    final contact = controller.names[index];
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(contact['name'] ?? ''),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          controller.deleteName(index);
                        },
                      ),
                      onTap: () => controller.showEditDialog(contact),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
