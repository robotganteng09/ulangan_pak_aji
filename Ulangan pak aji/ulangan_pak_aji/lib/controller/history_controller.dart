import 'package:get/get.dart';
import 'package:ulangan_pak_aji/db_helper.dart';
import 'package:ulangan_pak_aji/widgets/listArray.dart';

class HistoryController extends GetxController {
  var historyList = <Map<String, dynamic>>[].obs;

  // Instansiasi DBHelper untuk mengakses database
  final dbHelper = DBHelper();

  @override
  void onInit() {
    super.onInit();
    // Muat data riwayat saat controller pertama kali dibuat
    loadHistoryTodos();
  }

  // 🔹 Fungsi untuk memuat todo yang sudah selesai dari DB
  // Ini menggantikan logika 'addHistory' manual di memori
  Future<void> loadHistoryTodos() async {
    // Fungsi ini akan mengambil data dari DB di mana 'isDone' = 1
    final data = await dbHelper.getCompletedTodos();
    historyList.value = data;
  }

  // 🔹 Hapus Riwayat
  // Fungsi ini akan menghapus item dari database secara permanen
  Future<void> deleteHistory(int id, String title) async {
    // 1. Hapus dari Database
    await dbHelper.deleteTodo(id);

    // 2. Hapus dari list lokal dan refresh
    historyList.removeWhere((item) => item['id'] == id);
  }
}
