import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/ProfillePage.dart';
import 'package:ulangan_pak_aji/pages/responsive%20history/history_wide_page.dart';
import 'package:ulangan_pak_aji/pages/responsive%20home/home_wide_page.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [HomeWidePage(), ExamplePage(), Profillepage()];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
