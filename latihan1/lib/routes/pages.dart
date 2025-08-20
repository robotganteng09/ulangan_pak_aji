import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/calculator_page.dart';
import 'package:latihan1/pages/edit_football_player.dart';
import 'package:latihan1/pages/football_player.dart';
import 'package:latihan1/pages/profile_page.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:latihan1/widgets/bottomNav.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.CalculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.FootballPage, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.footballeditor, page: () => EditPlayerPage()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),

    GetPage(
      name: AppRoutes.bottomNav,
      page: () => BottomNavScaffold(
        pages: [CalculatorPage(), FootballPlayer(), ProfilePage()],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calc"),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: "Football",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: "profile"),
        ],
      ),
    ),
  ];
}
