import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/HistoryPage.dart';
import 'package:ulangan_pak_aji/pages/ProfillePage.dart';
import 'package:ulangan_pak_aji/pages/homePage.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [Homepage(), HistoryPage(), Profillepage()];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
