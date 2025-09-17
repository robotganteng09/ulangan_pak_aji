import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';

class Loginbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
