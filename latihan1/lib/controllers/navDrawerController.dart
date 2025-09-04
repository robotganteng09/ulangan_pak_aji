import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/calculator_Page.dart';
import 'package:latihan1/pages/football_Player.dart';
import 'package:latihan1/pages/profile_page.dart';

class BarmenuController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pagess = [
    CalculatorPage(),
    FootballPlayer(),
    ProfilePage(),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}
