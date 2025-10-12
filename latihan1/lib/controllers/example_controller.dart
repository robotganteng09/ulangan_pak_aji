import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExampleController extends GetxController {
  var ismobile = true.obs;
  void updatelayout(BoxConstraints constrains) {
    ismobile.value = constrains.maxWidth < 600;
  }
}
