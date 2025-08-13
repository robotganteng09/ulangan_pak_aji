import 'package:get/get.dart';
import 'package:latihan1/pages/calculator_page.dart';
import 'package:latihan1/pages/edit_football_player.dart';
import 'package:latihan1/pages/football_player.dart';
import 'package:latihan1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.CalculatorPage, page: () => CalculatorPage()),
    GetPage(name: AppRoutes.FootballPage, page: () => FootballPlayer()),
    GetPage(name: AppRoutes.footballeditor, page: () => EditPlayerPage()),
  ];
}
