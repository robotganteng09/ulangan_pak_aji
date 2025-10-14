import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controller/login_controller.dart';
import '/widgets/app_colors.dart';
import '/widgets/profile_card.dart';
import '/widgets/buttonReusable.dart';

class ProfileWide extends StatelessWidget {
  ProfileWide({super.key});

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
              // 🔹 Judul "Profile" kanan atas
              const Positioned(
                top: 0,
                right: 0,
                child: Text(
                  "Profile",
                  style: TextStyle(
                    color: AppColors.neon,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // 🔹 Isi Utama (dua kartu di tengah)
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 700;
                    final children = const [
                      ProfileCard(
                        username: "Narendra / 20 / XI PPLG 2",
                        imagePath: "assets/image/naren.jpg",
                        subtext: "Kata kata hari ini",
                        compact: true,
                      ),
                      SizedBox(width: 60, height: 40),
                      ProfileCard(
                        username: "Arsya / 9 / IX PPLG 2",
                        imagePath: "assets/image/arsya.jpg",
                        subtext: "Kata kata hari ini",
                        compact: true,
                      ),
                    ];

                    return isMobile
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: children,
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: children,
                          );
                  },
                ),
              ),

              // 🔹 Tombol Logout kanan bawah
              Positioned(
                bottom: 35,
                right: 30,
                child: SizedBox(
                  width: 150,
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
      ),
    );
  }
}
