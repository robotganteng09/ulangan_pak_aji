import 'package:get/get.dart';
import 'package:ulangan_pak_aji/db_helper.dart';

class HistoryController extends GetxController {
  var historyList = <Map<String, dynamic>>[].obs;
  final dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    loadHistoryTodos();
  }

  //load history list
  Future<void> loadHistoryTodos() async {
    final data = await dbHelper.getCompletedTodos();
    historyList.assignAll(data);
  }

  //delte history
  Future<void> deleteHistory(int id, String title) async {
    await dbHelper.deleteTodo(id);
    final updatedList = List<Map<String, dynamic>>.from(historyList);
    updatedList.removeWhere((item) => item['id'] == id);

    historyList.assignAll(updatedList);
  }
}
