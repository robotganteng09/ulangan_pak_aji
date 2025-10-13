import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ulangan_pak_aji/controller/editcontroller.dart';

class Editbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Editcontroller>(() => Editcontroller());
  }
}
