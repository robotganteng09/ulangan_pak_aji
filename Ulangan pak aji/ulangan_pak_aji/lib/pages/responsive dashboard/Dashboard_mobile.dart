import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/dashboard_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class DashboardMobile extends StatelessWidget {
  DashboardMobile({super.key});

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,

        // 🔹 Body berubah sesuai tab yang dipilih
        body:
            dashboardController.pages[dashboardController.selectedIndex.value],

        // 🔹 NAV BAR
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFF161617),
          currentIndex: dashboardController.selectedIndex.value,
          onTap: dashboardController.changeTab,
          selectedItemColor: AppColors.neon,
          unselectedItemColor: AppColors.textLight,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
