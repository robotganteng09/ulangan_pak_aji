import 'package:get/get.dart';
import 'package:latihan1/bindings/calculator.binding.dart';
import 'package:latihan1/bindings/example_bnding.dart';
import 'package:latihan1/bindings/home_binding.dart';
import 'package:latihan1/bindings/login_binding.dart';
import 'package:latihan1/bindings/splashcreen_binding.dart';
import 'package:latihan1/pages/calculator_page.dart';
import 'package:latihan1/pages/contact_page.dart';
import 'package:latihan1/pages/edit_football_player.dart';
import 'package:latihan1/pages/example_transformPage.dart';
import 'package:latihan1/pages/football_player.dart';
import 'package:latihan1/pages/login_page.dart';
import 'package:latihan1/pages/mainmenu.dart';
import 'package:latihan1/pages/navDrawerPage.dart';
import 'package:latihan1/pages/profile_page.dart';
import 'package:latihan1/pages/splashcreen_page.dart';
import 'package:latihan1/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.CalculatorPage,
      page: () => CalculatorPage(),
      binding: Calculatorbinding(),
    ),

    GetPage(
      name: AppRoutes.FootballPage,
      page: () => FootballPlayer(),
      binding: mainBinding(),
    ),
    GetPage(
      name: AppRoutes.footballeditor,
      page: () => EditPlayerPage(),
      binding: mainBinding(),
    ),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => MainmenuPage(),
      binding: mainBinding(),
    ),
    GetPage(
      name: AppRoutes.navdrawer,
      page: () => Navdrawerpage(),
      binding: mainBinding(),
    ),
    GetPage(
      name: AppRoutes.LoginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Splashcreen,
      page: () => SplashcreenPage(),
      binding: SplashcreenBinding(),
    ),

    GetPage(name: AppRoutes.Contactpage, page: () => ContactPage()),
    GetPage(
      name: AppRoutes.Examplepage,
      page: () => ExampleTransformpage(),
      binding: ExampleBnding(),
    ),
  ];
}
