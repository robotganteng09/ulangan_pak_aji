import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/time_controller.dart';
import 'package:ulangan_pak_aji/controller/wide_controller.dart';

class WideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WideController>(() => WideController());
  }
}
