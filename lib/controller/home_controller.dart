import 'package:get/get.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';

class HomeController extends GetxController {
  var todolist = <ToDoLIst>[].obs;

  void UpdateList(
    int index,
    String newtitle,
    String newDescription,
    bool newisDone,
  ) {
    todolist[index].Title = newtitle;
    todolist[index].Description = newDescription;
    todolist[index].isDone = newisDone;
    todolist.refresh();
  }

  void addList(String title, String description, String category) {
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
      ),
    );
  }
}
