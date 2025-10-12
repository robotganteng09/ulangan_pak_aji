import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/example_controller.dart';
import 'package:latihan1/pages/example_fitur/example_mobile.dart';
import 'package:latihan1/pages/example_fitur/example_widescreen.dart';
import 'package:latihan1/pages/footballplayerExample/football_mobile.dart';
import 'package:latihan1/pages/footballplayerExample/football_widescreen.dart';

class FootballPlayer extends StatelessWidget {
  FootballPlayer({super.key});

  final controller = Get.find<ExampleController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, Constraints) {
          controller.updatelayout(Constraints);
          return Obx(
            () => controller.ismobile.value
                ? FootballPlayerMobile()
                : FootballPlayerWide(),
          );
        },
      ),
    );
  }
}
