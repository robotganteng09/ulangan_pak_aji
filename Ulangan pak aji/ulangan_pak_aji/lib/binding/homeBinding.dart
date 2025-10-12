import 'package:get/get_instance/get_instance.dart';

import 'package:get/route_manager.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';

import 'package:ulangan_pak_aji/controller/home_controller.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DropDownController>(() => DropDownController());
    Get.lazyPut<DateController>(() => DateController());
  }
}
