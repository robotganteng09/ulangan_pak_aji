import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ulangan_pak_aji/pages/Dashboard.dart';
import 'package:ulangan_pak_aji/pages/History.dart';
import 'package:ulangan_pak_aji/pages/homePage.dart';

import 'package:ulangan_pak_aji/pages/loginPage.dart';
import 'package:ulangan_pak_aji/pages/navbar.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

class AppPage {
  static final pages = [
    GetPage(name: AppRoutes.Loginpage, page: () => Loginpage()),
    GetPage(name: AppRoutes.HomePage, page: () => Homepage()),
    GetPage(name: AppRoutes.Navbar, page: () => Navbar()),
    GetPage(name: AppRoutes.Dashboard, page: () => Dashboard()),
    GetPage(name: AppRoutes.Dashboard, page: () => History())
  ];
}
