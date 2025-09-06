import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/History.dart';
import 'package:ulangan_pak_aji/pages/HomePage.dart';
import 'package:ulangan_pak_aji/pages/ProfillePage.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [Homepage(), History(), Profillepage()];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
