import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';

class EditTodoController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController categoryController;
  late int index;
  RxBool isDone = false.obs;

  final homeController = Get.find<HomeController>();
  final dateController = Get.find<DateController>();

  String formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat("d MMMM yyyy", "id_ID").format(date);
  }

  void setTodo(int idx, ToDoLIst todo) {
    index = idx;
    titleController = TextEditingController(text: todo.Title);
    descController = TextEditingController(text: todo.Description);
    categoryController = TextEditingController(text: todo.category);
    isDone.value = todo.isDone;

    dateController.selectedDate.value = todo.dueDate;
    dateController.dateController.text = formatDate(todo.dueDate);
  }

  void updateTodo() {
    homeController.UpdateList(
      index,
      titleController.text,
      descController.text,
      isDone.value,
      categoryController.text,
      dateController.selectedDate.value,
    );
    homeController.todolist[index].category = categoryController.text;
    Get.back();
  }

  void deleteTodo() {
    homeController.todolist.removeAt(index);
    Get.back();
  }

  @override
  void onClose() {
    titleController.dispose();
    descController.dispose();
    categoryController.dispose();
    super.onClose();
  }
}
