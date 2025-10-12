import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/time_controller.dart';

class TimeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TimeController>(() => TimeController());
  }

}