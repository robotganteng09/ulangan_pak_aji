import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:latihan1/controllers/bottomNavController.dart';

class BottomNavScaffold extends StatelessWidget {
  final List<Widget> pages;
  final List<BottomNavigationBarItem> items;

  BottomNavScaffold({Key? key, required this.pages, required this.items})
    : super(key: key);

  final Bottomnavcontroller controller = Get.put(Bottomnavcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          items: items,
        ),
      ),
    );
  }
}
