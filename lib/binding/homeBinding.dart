import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
