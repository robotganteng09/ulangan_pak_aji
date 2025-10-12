import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:latihan1/controllers/splashcreencontroller.dart';

class SplashcreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashcreenController>(() => SplashcreenController());
  }
}
