import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/dashboard_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/history_controller.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';

class Dashboardbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<HistoryController>(() => HistoryController());
    Get.lazyPut<DropDownController>(() => DropDownController());
  }
}
