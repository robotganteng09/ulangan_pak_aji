import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';

class EditTodoController extends GetxController {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController categoryController;
  late int index;
  RxBool isDone = false.obs;

  final homeController = Get.find<HomeController>();

  void setTodo(int idx, ToDoLIst todo) {
    index = idx;
    titleController = TextEditingController(text: todo.Title);
    descController = TextEditingController(text: todo.Description);
    categoryController = TextEditingController(text: todo.category);
    isDone.value = todo.isDone;
  }

  void updateTodo() {
    homeController.UpdateList(
      index,
      titleController.text,
      descController.text,
      isDone.value,
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
