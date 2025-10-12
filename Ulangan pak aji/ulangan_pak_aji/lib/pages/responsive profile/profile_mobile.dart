import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import '/widgets/profile_card.dart';
import '/widgets/app_colors.dart';

class ProfilleMobile extends StatelessWidget {
  ProfilleMobile({super.key});

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Header
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.neon,
                ),
              ),
            ),

            // 🔹 Isi profil (scrollable)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: const [
                    ProfileCard(
                      username: "Narendra/20/XI PPLG 2",
                      imagePath: "assets/image/naren.jpg",
                      subtext: "Saya manusia, makan nasi",
                    ),
                    ProfileCard(
                      username: "Arsya/9/IX PPLG 2",
                      imagePath: "assets/image/arsya.jpg",
                      subtext: "Gua mah ganteng",
                    ),
                  ],
                ),
              ),
            ),

            // 🔹 Tombol logout
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 16, right: 16),
              child: SizedBox(
                width: double.infinity,
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
    );
  }
}
