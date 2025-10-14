import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/dashboard_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

class DashboardWide extends StatelessWidget {
  DashboardWide({super.key});

  final dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.background,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: AppColors.neon),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Text(
            [
              "Home",
              "History",
              "Profile",
            ][dashboardController.selectedIndex.value],
            style: const TextStyle(
              color: AppColors.neon,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ),
        drawer: _NavDrawer(),
        body:
            dashboardController.pages[dashboardController.selectedIndex.value],
      ),
    );
  }
}

class _NavDrawer extends StatelessWidget {
  final dashboardController = Get.find<DashboardController>();

  _NavDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF1A1A1A),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: AppColors.neon.withOpacity(0.15)),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.neon,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _drawerItem(icon: Icons.home, title: "Home", index: 0),
          _drawerItem(icon: Icons.history, title: "History", index: 1),
          _drawerItem(icon: Icons.person, title: "Profile", index: 2),
          const Divider(color: Colors.grey, thickness: 0.3),
        ],
      ),
    );
  }

  Widget _drawerItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    return Obx(() {
      final isSelected = dashboardController.selectedIndex.value == index;
      return ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppColors.neon : Colors.white70,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isSelected ? AppColors.neon : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        onTap: () {
          dashboardController.changeTab(index);
          Get.back();
        },
      );
    });
  }
}
