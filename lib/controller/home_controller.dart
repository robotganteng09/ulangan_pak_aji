import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';

class HomeController extends GetxController {
  var todolist = <ToDoLIst>[].obs;

  HistoryController historyController = Get.put(HistoryController());
  DropDownController dropDownController = Get.find<DropDownController>();

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
    if (title.isEmpty || description.isEmpty || category.isEmpty) {
      Get.snackbar("Gagal", "Semua field harus diisi!");
      return;
    }

    todolist.add(
      ToDoLIst(
        Title: title,
        Description: description,
        category: category,
        isDone: false,
        dueDate: dueDate,
      ),
    );
    dropDownController.setSelected("");
  }

  void updateCategory(int index, String newCategory) {
    todolist[index].category = newCategory;
    todolist.refresh();
  }
}
