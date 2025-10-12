import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:latihan1/controllers/MainmenuController.dart';
import 'package:latihan1/controllers/calculator_controller.dart';
import 'package:latihan1/controllers/example_controller.dart';
import 'package:latihan1/controllers/football_player_controller.dart';
import 'package:latihan1/controllers/logincontroller.dart';
import 'package:latihan1/controllers/splashcreencontroller.dart';

class mainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<MainmenuController>(() => MainmenuController());
    Get.lazyPut<FootballPlayerController>(() => FootballPlayerController());
    Get.lazyPut<Logincontroller>(() => Logincontroller());
    Get.lazyPut<SplashcreenController>(() => SplashcreenController());
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}
