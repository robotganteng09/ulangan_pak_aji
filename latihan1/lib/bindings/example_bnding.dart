import 'package:get/get.dart';
import 'package:latihan1/controllers/example_controller.dart';

class ExampleBnding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExampleController>(() => ExampleController());
  }
}
