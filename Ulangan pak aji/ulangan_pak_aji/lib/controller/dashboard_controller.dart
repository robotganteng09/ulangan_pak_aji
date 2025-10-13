import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/responsive home/home_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20history/history_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20profile/profile_mobile.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  // 🔹 Masukkan halaman-halaman mobile di sini
  final List<Widget> pages = [
    const HomeMobile(),
    HistoryMobile(),
    ProfilleMobile(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
