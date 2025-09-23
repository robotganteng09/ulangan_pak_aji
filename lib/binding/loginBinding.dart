import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
