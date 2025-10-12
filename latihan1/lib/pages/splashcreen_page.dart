import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/splashcreencontroller.dart';

class SplashcreenPage extends StatelessWidget {
  SplashcreenPage({super.key});
  final controller = Get.find<SplashcreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Splashcreen Page")));
  }
}
