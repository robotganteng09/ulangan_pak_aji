import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/dbHelper/db_helper.dart';

class ContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final names = <Map<String, dynamic>>[].obs;
  final _dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    fetchNames();
  }

  Future<void> fetchNames() async {
    final data = await _dbHelper.getNames();
    names.assignAll(data);
  }

  Future<void> addName() async {
    final text = nameController.text.trim();
    if (text.isEmpty) return;
    await _dbHelper.insertName(text);
    nameController.clear();
    fetchNames();
  }

  Future<void> deleteName(int index) async {
    if (index < 0 || index >= names.length) return;

    final contact = names[index];
    final dbId = contact['id'] as int;
    final contactName = contact['name'] as String;

    await _dbHelper.deleteName(dbId);

    fetchNames();
  }

  void showEditDialog(Map<String, dynamic> contact) {
    final txteditController = TextEditingController(text: contact['name']);

    Get.defaultDialog(
      title: "Edit Contact",
      content: Column(
        children: [
          TextField(
            controller: txteditController,
            decoration: const InputDecoration(labelText: "Name"),
          ),
        ],
      ),
      textCancel: "Cancel",
      textConfirm: "Save",
      confirmTextColor: Colors.white,
      onCancel: () {},
      onConfirm: () async {
        final newName = txteditController.text.trim();
        if (newName.isEmpty) return;

        await updateContact(contact['id'], newName);
        Get.back();
      },
    );
  }

  Future<void> updateContact(int id, String newName) async {
    await _dbHelper.updateName(id, newName);
    fetchNames();
  }

  @override
  void onClose() {
    nameController.dispose();
    super.onClose();
  }
}
