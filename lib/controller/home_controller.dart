import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';

class HomeController extends GetxController {
  var todolist = <ToDoLIst>[].obs;
  final titleController = TextEditingController();
  final descController = TextEditingController();

  HistoryController historyController = Get.put(HistoryController());
  DropDownController dropDownController = Get.find<DropDownController>();
  DateController dateController = Get.find<DateController>();

  void UpdateList(
    int index,
    String newtitle,
    String newDescription,
    bool newisDone,
    String newCategory,
    DateTime? newDueDate,
  ) {
    bool wasDone = todolist[index].isDone;

    todolist[index].Title = newtitle;
    todolist[index].Description = newDescription;
    todolist[index].isDone = newisDone;
    todolist[index].category = newCategory;
    todolist[index].dueDate = newDueDate;

    if (newisDone && !wasDone) {
      historyController.addHistory(todolist[index]);
      todolist.removeAt(index);
    } else if (!newisDone && wasDone) {
      historyController.deleteHistory(todolist[index]);
    }
    todolist.refresh();
  }

  void addList(
    String title,
    String description,
    String category,
    DateTime? dueDate,
  ) {
    final DateTime? finalDueDate = dueDate ?? dateController.selectedDate.value;

    todolist.add(
      ToDoLIst(
        Title: title,
        Description: description,
        category: category,
        isDone: false,
        dueDate: finalDueDate,
      ),
    );
    dropDownController.setSelected("");
    dateController.clear();
  }

  void updateCategory(int index, String newCategory) {
    todolist[index].category = newCategory;
    todolist.refresh();
  }

  void clearForm() {
    titleController.clear();
    descController.clear();
    dropDownController.setSelected("");
    dateController.clear();
  }
void deleteTodo(int index) {
    final todoToDelete = todolist[index];
    if (todoToDelete.isDone) {
      historyController.deleteHistory(todoToDelete);
    }
  
    todolist.removeAt(index);

    Get.snackbar(
      'Berhasil',
      'Aktivitas "${todoToDelete.Title}" telah dihapus.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          Get.theme.snackBarTheme.backgroundColor?.withOpacity(0.8) ??
          Color(0xFF333333),
    );

    todolist.refresh();
  }
}
