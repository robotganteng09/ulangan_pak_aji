import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/db_helper.dart';

class Editcontroller extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  var isDone = false.obs;
  int? currentIndex;
  int? currentId;

  final DBHelper dbHelper = DBHelper();

  /// Set data awal dari todo
  void setTodo(int index, Map<String, dynamic> todo) {
    currentIndex = index;
    currentId = todo['id'];
    titleController.text = todo['title'] ?? "";
    descController.text = todo['description'] ?? "";
    isDone.value = todo['isDone'] == 1;
  }

  /// Format tanggal menjadi string cantik
  String formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  /// Parse string tanggal dari database ke DateTime
  DateTime? parseDate(dynamic dateStr) {
    if (dateStr == null || dateStr.toString().isEmpty) return null;
    try {
      return DateTime.parse(dateStr.toString());
    } catch (_) {
      return null;
    }
  }

  /// 🟢 Update Todo di database
  Future<void> updateTodo({
    required String category,
    required DateTime? dueDate,
  }) async {
    if (currentId == null) return;

    final data = {
      'title': titleController.text,
      'description': descController.text,
      'isDone': isDone.value ? 1 : 0,
      'category': category,
      'dueDate': dueDate?.toIso8601String(),
    };

    await dbHelper.updateTodo(currentId!, data);

    // 🔄 Refresh hanya todo yang belum selesai di Home
    final homeC = Get.find<HomeController>();
    homeC.todolist.value = await dbHelper.getPendingTodos();
    homeC.todolist.refresh();

    // 🔄 Refresh halaman History agar selesai langsung muncul di sana
    if (Get.isRegistered<HistoryController>()) {
      final historyC = Get.find<HistoryController>();
      await historyC.loadHistoryTodos();
    }

    Get.back();
  }

  /// 🔴 Hapus Todo dari database
  void deleteTodo() async {
    if (currentId != null) {
      await dbHelper.deleteTodo(currentId!);

      // Refresh Home list
      final homeC = Get.find<HomeController>();
      homeC.todolist.value = await dbHelper.getPendingTodos();
      homeC.todolist.refresh();

      // Refresh History jika terbuka
      if (Get.isRegistered<HistoryController>()) {
        final historyC = Get.find<HistoryController>();
        await historyC.loadHistoryTodos();
      }

      Get.back();
    }
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    super.onClose();
  }
}
