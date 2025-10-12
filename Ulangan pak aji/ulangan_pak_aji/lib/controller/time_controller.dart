import 'package:get/get.dart';
import 'dart:async';

class TimeController extends GetxController {
  var currentTime = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentTime.value = DateTime.now(); 
    });
  }
}
