import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:latihan1/controllers/logincontroller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Logincontroller>(() => Logincontroller());
  }
}
