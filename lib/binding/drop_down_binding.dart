import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';

class DropDownBinding extends Bindings {
  @override
  //komen
  void dependencies() {
    Get.lazyPut<DropDownController>(() => DropDownController());
  }
}
