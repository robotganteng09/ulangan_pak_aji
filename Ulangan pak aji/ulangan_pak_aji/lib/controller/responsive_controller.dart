import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  var ismobile = true.obs;
  void updatelayout(BoxConstraints constrains) {
    ismobile.value = constrains.maxWidth < 600;
  }

  //testt
}
