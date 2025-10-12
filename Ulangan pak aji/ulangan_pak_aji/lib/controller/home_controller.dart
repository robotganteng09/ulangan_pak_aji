import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';

import 'package:ulangan_pak_aji/db_helper.dart';

class HomeController extends GetxController {
  var todolist = <Map<String, dynamic>>[].obs;

  final titleController = TextEditingController();
  final descController = TextEditingController();

  final dbHelper = DBHelper();
  final historyController = Get.put(HistoryController());
  final dropDownController = Get.find<DropDownController>();
  final dateController = Get.find<DateController>();

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  // 🔹 Load dari DB
  Future<void> loadTodos() async {
    final data = await dbHelper.getTodos();
    todolist.value = data; // langsung assign list<Map<String, dynamic>>
  }

  // 🔹 Tambah Data
  Future<void> addList(
    String title,
    String description,
    String category,
    DateTime? dueDate,
  ) async {
    final due = (dueDate ?? dateController.selectedDate.value) != null
        ? (dueDate ?? dateController.selectedDate.value)!.toIso8601String()
        : '';

    await dbHelper.insertTodo({
      'title': title,
      'description': description,
      'category': category,
      'isDone': 0,
      'dueDate': due,
    });

    // Reload list
    await loadTodos();

    clearForm();
  }

  // 🔹 Update Data
  Future<void> updateList(
    int index,
    String newtitle,
    String newDescription,
    bool newisDone,
    String newCategory,
    DateTime? newDueDate,
  ) async {
    final todo = todolist[index];
    final id = todo['id'];

    await dbHelper.updateTodo(id, {
      'title': newtitle,
      'description': newDescription,
      'category': newCategory,
      'isDone': newisDone ? 1 : 0,
      'dueDate': newDueDate?.toIso8601String() ?? '',
    });

    // Update nilai lokal
    todolist[index] = {
      'id': id,
      'title': newtitle,
      'description': newDescription,
      'category': newCategory,
      'isDone': newisDone ? 1 : 0,
      'dueDate': newDueDate?.toIso8601String() ?? '',
    };

    todolist.refresh();
  }

  // 🔹 Hapus Data
  Future<void> deleteTodo(int index) async {
    final todo = todolist[index];
    final id = todo['id'];

    await dbHelper.deleteTodo(id);
    todolist.removeAt(index);

    Get.snackbar(
      'Berhasil',
      'Aktivitas "${todo['title']}" telah dihapus.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          Get.theme.snackBarTheme.backgroundColor?.withOpacity(0.8) ??
          const Color(0xFF333333),
    );
  }

  // 🔹 Clear form input
  void clearForm() {
    titleController.clear();
    descController.clear();
    dropDownController.clear();
    dateController.clear();
  }
}
