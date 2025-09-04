import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ulangan_pak_aji/pages/addTodoPage.dart';
import 'package:ulangan_pak_aji/pages/editTodoPage.dart';
import 'package:ulangan_pak_aji/pages/homePage.dart';
import 'package:ulangan_pak_aji/pages/loginPage.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

class AppPage {
  static final pages = [
    GetPage(name: AppRoutes.Loginpage, page: () => Loginpage()),
    GetPage(name: AppRoutes.Homepage, page: () => Homepage()),
    GetPage(name: AppRoutes.Addpage, page: () => AddPage()),
    GetPage(name: AppRoutes.Editpage, page: () => EditTodoPage()),
  ];
}
