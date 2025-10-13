import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/routes/route.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';

/// Widget gabungan untuk Drawer + Tombol Burger Menu
class DashboardWide extends StatelessWidget {
  const DashboardWide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 🔹 Drawer (sisi kiri)
      drawer: Drawer(
        backgroundColor: const Color(0xFF1A1A1A),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: AppColors.neon.withOpacity(0.2)),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: AppColors.neon,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text(
                'Beranda',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.back(); // Menutup drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Get.toNamed(AppRoutes.Profillepage);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text(
                'Tentang Aplikasi',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),

      // 🔹 AppBar dengan tombol burger menu
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: AppColors.neon),
            onPressed: () => Scaffold.of(context).openDrawer(), // buka drawer
          ),
        ),
        title: const Text(
          "Menu Utama",
          style: TextStyle(
            color: AppColors.neon,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),

      // 🔹 Konten utama (bisa kamu ganti sesuai kebutuhan)
      body: const Center(
        child: Text(
          "Konten halaman di sini",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
