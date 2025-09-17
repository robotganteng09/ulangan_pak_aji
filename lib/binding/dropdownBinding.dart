import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';

class Dropdownbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DropDownController>(() => DropDownController());
  }
}
