import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/Dashboard.dart';
import 'package:ulangan_pak_aji/pages/History.dart';
import 'package:ulangan_pak_aji/pages/HomePage.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [Homepage(),Dashboard(),History()];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
