import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class WideController extends GetxController {
  var isMobile = true.obs;
  void updateLayout(BoxConstraints constraints) {
    isMobile.value = constraints.maxWidth < 600;
  }
}
