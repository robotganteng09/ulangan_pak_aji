import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/responsive_controller.dart';

class ResponsiveBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResponsiveController>(() => ResponsiveController());
  }
}
