import 'package:get/get.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';

class HistoryController extends GetxController {
  var completedList = <ToDoLIst>[].obs;

  void addHistory(ToDoLIst todo) {
    {
      completedList.add(todo);
    }
  }

  void deleteHistory(ToDoLIst todo) {
    completedList.remove(todo);
  }
}
