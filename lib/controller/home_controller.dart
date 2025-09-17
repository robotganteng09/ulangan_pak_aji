import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';

class HomeController extends GetxController {
  //list untuk menyimpan todo
  var todolist = <ToDoLIst>[].obs;

  // Controller
  HistoryController historyController = Get.put(HistoryController());
  DropDownController dropDownController = Get.find<DropDownController>();

  // Update todo yang sudah ada
  void UpdateList(
    int index,
    String newtitle,
    String newDescription,
    bool newisDone,
    String newCategory,
    DateTime? newDueDate,
  ) {
    bool wasDone = todolist[index].isDone;

    // Update nilai baru
    todolist[index].Title = newtitle;
    todolist[index].Description = newDescription;
    todolist[index].isDone = newisDone;
    todolist[index].category = newCategory;
    todolist[index].dueDate = newDueDate;

    //Untuk mindahin ke history kalau done
    if (newisDone && !wasDone) {
      historyController.addHistory(todolist[index]);
      todolist.removeAt(index); //hapus dari homepage
    } else if (!newisDone && wasDone) {
      historyController.deleteHistory(todolist[index]);
    }

    todolist.refresh(); // refresh UI
  }

  // Tambahkan todo baru
  void addList(
    String title,
    String description,
    String category,
    DateTime? dueDate,
  ) {
    //chek: tidak boleh kosong
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
    todolist.refresh(); // supaya UI ikut berubah
  }
}
