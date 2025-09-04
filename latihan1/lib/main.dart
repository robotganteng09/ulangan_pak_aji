import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:latihan1/bindings/home_binding.dart';
import 'package:latihan1/routes/pages.dart';
import 'package:latihan1/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '11PPLG2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialBinding: mainBinding(),
      initialRoute: AppRoutes.bottomNav,
      getPages: AppPages.pages,
    );
  }
}
