import 'package:get/get.dart';
import 'package:latihan1/bindings/calculator.binding.dart';
import 'package:latihan1/pages/calculator_page.dart';
import 'package:latihan1/pages/edit_football_player.dart';
import 'package:latihan1/pages/football_player.dart';
import 'package:latihan1/pages/mainmenu.dart';
import 'package:latihan1/pages/navDrawerPage.dart';
import 'package:latihan1/pages/profile_page.dart';
import 'package:latihan1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.CalculatorPage,
      page: () => CalculatorPage(),
      binding: Calculatorbinding(),
    ),

    GetPage(name: AppRoutes.FootballPage, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.footballeditor, page: () => EditPlayerPage()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.bottomNav, page: () => MainmenuPage()),
    GetPage(name: AppRoutes.navdrawer, page: () => Navdrawerpage()),
  ];
}
