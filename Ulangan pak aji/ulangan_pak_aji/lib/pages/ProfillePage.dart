import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import '/widgets/profile_card.dart';
import '/widgets/app_colors.dart';

class Profillepage extends StatelessWidget {
  Profillepage({super.key});

  // ambil controller
  final LoginController logincontroller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: const [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.neon,
                    ),
                  ),
                ],
              ),
            ),

            // isi profile card
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  children: const [
                    ProfileCard(
                      username: "Narendra/20/XI PPLG 2",
                      imagePath: "assets/image/naren.jpg",
                      subtext: "saya manusia, makan nasi",
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

            // tombol logout
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: "Logout",
                backgroundColor: Colors.red,
                textColor: Colors.white,
                onPressed: logincontroller.logout,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
