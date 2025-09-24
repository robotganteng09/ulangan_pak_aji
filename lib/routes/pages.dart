import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ulangan_pak_aji/binding/dashboardBinding.dart';
import 'package:ulangan_pak_aji/binding/historyBinding.dart';

import 'package:ulangan_pak_aji/binding/homeBinding.dart';
import 'package:ulangan_pak_aji/binding/loginBinding.dart';
import 'package:ulangan_pak_aji/binding/splash_binding.dart';
import 'package:ulangan_pak_aji/pages/Dashboard.dart';
import 'package:ulangan_pak_aji/pages/HistoryPage.dart';
import 'package:ulangan_pak_aji/pages/ProfillePage.dart';
import 'package:ulangan_pak_aji/pages/SplashScreen.dart';
import 'package:ulangan_pak_aji/pages/addTodoPage.dart';
import 'package:ulangan_pak_aji/pages/editTodoPage.dart';
import 'package:ulangan_pak_aji/pages/homePage.dart';
import 'package:ulangan_pak_aji/pages/loginPage.dart';

import 'package:ulangan_pak_aji/routes/route.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.Loginpage,
      page: () => Loginpage(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: AppRoutes.Homepage,
      page: () => Homepage(),
      bindings: [Homebinding()],
    ),
    GetPage(name: AppRoutes.Addpage, page: () => AddPage()),
    GetPage(name: AppRoutes.Editpage, page: () => EditTodoPage()),
    GetPage(name: AppRoutes.Profillepage, page: () => Profillepage()),
    GetPage(
      name: AppRoutes.Dashboard,
      page: () => Dashboard(),
      bindings: [Dashboardbinding(), Homebinding(), Historybinding()],
    ),
    GetPage(name: AppRoutes.History, page: () => History()),
    GetPage(name: AppRoutes.Splashscreen, page: () => Splashscreen(),binding: SplashBinding())
  ];
}
