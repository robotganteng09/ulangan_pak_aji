import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ulangan_pak_aji/binding/dashboardBinding.dart';
import 'package:ulangan_pak_aji/binding/editBinding.dart';
import 'package:ulangan_pak_aji/binding/historyBinding.dart';

import 'package:ulangan_pak_aji/binding/homeBinding.dart';
import 'package:ulangan_pak_aji/binding/loginBinding.dart';
import 'package:ulangan_pak_aji/binding/responsive_binding.dart';
import 'package:ulangan_pak_aji/binding/splash_binding.dart';
import 'package:ulangan_pak_aji/binding/time_binding.dart';
import 'package:ulangan_pak_aji/binding/wide_binding.dart';

import 'package:ulangan_pak_aji/pages/addTodoPage.dart';
import 'package:ulangan_pak_aji/pages/editTodoPage.dart';
import 'package:ulangan_pak_aji/pages/responsive%20add/addTodo_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20add/addTodo_wide.dart';
import 'package:ulangan_pak_aji/pages/responsive%20dashboard/Dashboard_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20dashboard/Dashboard_wide.dart';
import 'package:ulangan_pak_aji/pages/responsive%20edit/edit_Wide.dart';
import 'package:ulangan_pak_aji/pages/responsive%20edit/edit_mobile.dart';
import 'package:ulangan_pak_aji/pages/HistoryPage.dart';
import 'package:ulangan_pak_aji/pages/ProfillePage.dart';
import 'package:ulangan_pak_aji/pages/SplashScreen.dart';

import 'package:ulangan_pak_aji/pages/homePage.dart';

import 'package:ulangan_pak_aji/pages/loginPage.dart';
import 'package:ulangan_pak_aji/pages/responsive%20history/history_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20history/history_wide.dart';
import 'package:ulangan_pak_aji/pages/responsive%20home/home_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20home/home_wide.dart';
import 'package:ulangan_pak_aji/pages/responsive%20profile/profile_mobile.dart';
import 'package:ulangan_pak_aji/pages/responsive%20profile/profile_wide.dart';

import 'package:ulangan_pak_aji/routes/route.dart';

class AppPage {
  static final pages = [
    GetPage(
      name: AppRoutes.Loginpage,
      page: () => Loginpage(),
      bindings: [Loginbinding(), ResponsiveBinding()],
    ),

    GetPage(
      name: AppRoutes.Addpage,
      page: () => AddPage(),
      bindings: [ResponsiveBinding()],
    ),
    GetPage(name: AppRoutes.AddPageMobile, page: () => AddPageMobile()),
    GetPage(
      name: AppRoutes.Editpage,
      page: () => Edittodopage(),
      bindings: [ResponsiveBinding(), Editbinding()],
    ),
    GetPage(
      name: AppRoutes.EditWidepage,
      page: () => Editwide(),
      binding: Editbinding(),
    ),
    GetPage(
      name: AppRoutes.EditMobilepage,
      page: () => EditTodoMobile(),
      binding: Editbinding(),
    ),

    GetPage(
      name: AppRoutes.Profillepage,
      page: () => Profillepage(),
      bindings: [ResponsiveBinding()],
    ),
    GetPage(
      name: AppRoutes.ProfilleMobile,
      page: () => ProfilleMobile(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: AppRoutes.ProfilleWide,
      page: () => ProfileWide(),
      binding: Loginbinding(),
    ),
    GetPage(
      name: AppRoutes.DashboardMobilePage,
      page: () => DashboardMobile(),
      bindings: [
        Dashboardbinding(),
        Homebinding(),
        Historybinding(),
        ResponsiveBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.DashboardWidePage,
      page: () => DashboardWide(),
      bindings: [
        Dashboardbinding(),
        Homebinding(),
        Historybinding(),
        ResponsiveBinding(),
      ],
    ),

    GetPage(
      name: AppRoutes.Splashscreen,
      page: () => Splashscreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.Homepage,
      page: () => Homepage(),
      binding: ResponsiveBinding(),
    ),
    GetPage(
      name: AppRoutes.HomeMobile,
      page: () => HomeMobile(),
      bindings: [Homebinding(), TimeBinding()],
    ),
    GetPage(
      name: AppRoutes.HomeWidePage,
      page: () => HomeWide(),
      bindings: [Homebinding(), TimeBinding()],
    ),
    GetPage(
      name: AppRoutes.addWidepage,
      page: () => AddtodoWide(),
      binding: WideBinding(),
    ),
    GetPage(name: AppRoutes.histoyMobilePage, page: () => HistoryMobile()),
    GetPage(name: AppRoutes.histoyMobilePage, page: () => HistoryWide()),
    GetPage(
      name: AppRoutes.History,
      page: () => HistoryPage(),
      binding: ResponsiveBinding(),
    ),
  ];
}
