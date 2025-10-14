import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';

import 'package:ulangan_pak_aji/db_helper.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

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

  //load db
  Future<void> loadTodos() async {
    final data = await dbHelper.getPendingTodos();

    todolist.value = data.map((row) => Map<String, dynamic>.from(row)).toList();
  }

  //add
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

    //relod
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

  //update list terbaru
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

    //update databas
    await dbHelper.updateTodo(id, {
      'title': newtitle,
      'description': newDescription,
      'category': newCategory,
      'isDone': newIsDoneValue,
      'dueDate': newDueDateString,
    });

    todo['title'] = newtitle;
    todo['description'] = newDescription;
    todo['category'] = newCategory;
    todo['isDone'] = newIsDoneValue;
    todo['dueDate'] = newDueDateString;

    if (newisDone) {
      // hapus dari home
      todolist.removeAt(index);
      await historyController.loadHistoryTodos();

      Get.snackbar(
        'Diperbarui',
        'Aktivitas "$newtitle" telah dipindahkan ke Riwayat.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.background,
        colorText: AppColors.textLight,
      );
    } else {
      todolist.refresh();
    }
  }

  // 🔹 Hapus Data
  Future<void> deleteTodo(int index) async {
    final todo = todolist[index];
    final id = todo['id'];

    await dbHelper.deleteTodo(id);
    todolist.removeAt(index);
  }

  // 🔹 Clear form input
  void clearForm() {
    titleController.clear();
    descController.clear();
    dropDownController.clear();
    dateController.clear();
  }
}
