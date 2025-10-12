import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan_pak_aji/controller/dashboard_controller.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';

class Dashboardbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
