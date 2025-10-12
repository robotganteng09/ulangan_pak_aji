import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';

class EditTodoController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  var isDone = false.obs;

  int? currentIndex;

  void setTodo(int index, dynamic todo) {
    currentIndex = index;
    titleController.text = todo.Title ?? "";
    descController.text = todo.Description ?? "";
    isDone.value = todo.isDone ?? false;
  }

  String formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat('dd MMMM yyyy', 'id_ID').format(date);
  }

  void deleteTodo() {
    if (currentIndex != null) {
      final homeC = Get.find<HomeController>();
      homeC.todolist.removeAt(currentIndex!);
      homeC.todolist.refresh();
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
