import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';

class Historybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(() => HistoryController());
  }
}
