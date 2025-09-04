import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:latihan1/controllers/MainmenuController.dart';
import 'package:latihan1/controllers/bottomNavController.dart';
import 'package:latihan1/controllers/calculator_controller.dart';
import 'package:latihan1/controllers/edit_player_controller.dart';
import 'package:latihan1/controllers/football_player_controller.dart';
import 'package:latihan1/pages/football_Player.dart';

class mainBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //inject calculatorController, EditPlayerController, FootballPlayerController;
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    Get.lazyPut<MainmenuController>(() => MainmenuController());
    Get.lazyPut<FootballPlayerController>(() => FootballPlayerController());
  }
}
