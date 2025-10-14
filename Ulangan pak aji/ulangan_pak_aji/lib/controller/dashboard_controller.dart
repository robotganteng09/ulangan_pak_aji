import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/HistoryPage.dart';
import 'package:ulangan_pak_aji/pages/ProfillePage.dart';
import 'package:ulangan_pak_aji/pages/homePage.dart';
import 'package:ulangan_pak_aji/pages/responsive home/home_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20history/history_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20profile/profile_mobile.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  // 🔹 Masukkan halaman-halaman mobile di sini
  final List<Widget> pages = [Homepage(), HistoryPage(), Profillepage()];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
