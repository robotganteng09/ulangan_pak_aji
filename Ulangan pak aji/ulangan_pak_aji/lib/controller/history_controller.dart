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

  // 🔹 Ambil todo yang sudah selesai dari database
  Future<void> loadHistoryTodos() async {
    final data = await dbHelper.getCompletedTodos();
    historyList.assignAll(data); // ✅ gunakan assignAll (bukan value = data)
  }

  // 🔹 Hapus todo dari history (hapus permanen dari DB)
  Future<void> deleteHistory(int id, String title) async {
    await dbHelper.deleteTodo(id);

    // Buat salinan baru agar tidak kena "read-only" error
    final updatedList = List<Map<String, dynamic>>.from(historyList);
    updatedList.removeWhere((item) => item['id'] == id);

    // Update observable dengan list baru
    historyList.assignAll(updatedList);
  }
}
