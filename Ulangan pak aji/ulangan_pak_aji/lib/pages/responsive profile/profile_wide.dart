import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import '/widgets/profile_card.dart';
import '/widgets/app_colors.dart';

class ProfilleWide extends StatelessWidget {
  ProfilleWide({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Stack(
            children: [
              // 🔹 Teks "Profile" di kanan atas
              const Positioned(
                top: 0,
                right: 0,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: AppColors.neon,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // 🔹 Dua kartu profil di tengah
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    ProfileCard(
                      username: "Narendra/20/XI PPLG 2",
                      imagePath: "assets/image/naren.jpg",
                      subtext: "Kata kata hari ini",
                      compact: true,
                    ),
                    SizedBox(width: 60),
                    ProfileCard(
                      username: "Arsya/9/IX PPLG 2",
                      imagePath: "assets/image/arsya.jpg",
                      subtext: "Kata kata hari ini",
                      compact: true,
                    ),
                  ],
                ),
              ),

              // 🔹 Tombol LOG OUT di kanan bawah
              Positioned(
                bottom: 35,
                right: 30,
                child: SizedBox(
                  width: 130,
                  height: 42,
                  child: CustomButton(
                    text: "LOG OUT",
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    onPressed: loginController.logout,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
