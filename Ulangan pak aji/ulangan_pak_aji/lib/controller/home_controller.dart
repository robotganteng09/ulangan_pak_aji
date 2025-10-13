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
    final data = await dbHelper.getPendingTodos();

    // SOLUSI: Konversi setiap QueryRow menjadi Map<String, dynamic> yang sederhana
    todolist.value = data.map((row) => Map<String, dynamic>.from(row)).toList();
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

  Future<void> toggleDoneStatus(int index) async {
    final todo = Map<String, dynamic>.from(todolist[index]);
    final id = todo['id'];
    final currentIsDone = todo['isDone'] == 1;

    final newIsDoneValue = currentIsDone ? 0 : 1;

    await dbHelper.updateTodo(id, {'isDone': newIsDoneValue});

    todo['isDone'] = newIsDoneValue;

    if (newIsDoneValue == 1) {
      todolist.removeAt(index);
    } else {
      todolist[index] = todo;
    }
    await historyController.loadHistoryTodos();
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
    final newIsDoneValue = newisDone ? 1 : 0;
    final newDueDateString = newDueDate?.toIso8601String() ?? '';

    // 1. UPDATE DATABASE
    await dbHelper.updateTodo(id, {
      'title': newtitle,
      'description': newDescription,
      'category': newCategory,
      'isDone': newIsDoneValue,
      'dueDate': newDueDateString,
    });

    // 2. UPDATE NILAI LOKAL (Mencegah 'Unsupported operation: read-only')
    // Alih-alih mengganti seluruh Map, kita perbarui key-value-nya:
    todo['title'] = newtitle;
    todo['description'] = newDescription;
    todo['category'] = newCategory;
    todo['isDone'] = newIsDoneValue;
    todo['dueDate'] = newDueDateString;

    // 3. LOGIKA PEMINDAHAN (Sama seperti toggleDoneStatus)
    if (newisDone) {
      // Hapus dari list aktif dan muat ulang riwayat
      todolist.removeAt(index);
      await historyController.loadHistoryTodos();

      Get.snackbar(
        'Diperbarui & Selesai! 🎉',
        'Aktivitas "$newtitle" telah dipindahkan ke Riwayat.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue.withOpacity(0.8),
        colorText: Colors.white,
      );
    } else {
      // Jika tidak dipindahkan, hanya refresh list aktif
      todolist.refresh();
    }
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
