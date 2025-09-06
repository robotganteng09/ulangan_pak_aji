import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final dashboardController = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body:
            dashboardController.pages[dashboardController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeTab,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "history",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
          ],
        ),
      ),
    );
  }
}
