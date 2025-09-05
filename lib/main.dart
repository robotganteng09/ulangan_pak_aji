import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/pages/loginPage.dart';
import 'package:ulangan_pak_aji/routes/pages.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.Dashboard,
      getPages: AppPage.pages,
    );
  }
}
