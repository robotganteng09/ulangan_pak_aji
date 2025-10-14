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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(height: 20),
                    ProfileCard(
                      username: "Narendra/20/XI PPLG 2",
                      imagePath: "assets/image/naren.jpg",
                      subtext: "Saya manusia, makan nasi",
                    ),
                    SizedBox(height: 24),
                    ProfileCard(
                      username: "Arsya/9/IX PPLG 2",
                      imagePath: "assets/image/arsya.jpg",
                      subtext: "Gua mah ganteng",
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: SizedBox(
                width: 160,
                height: 45,
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
