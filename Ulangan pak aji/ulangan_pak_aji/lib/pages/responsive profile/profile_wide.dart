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
            alignment: Alignment.center,
            children: [
              Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = constraints.maxWidth < 700;
                    final children = const [
                      ProfileCard(
                        username: "Narendra / 20 / XI PPLG 2",
                        imagePath: "assets/image/naren.jpg",
                        subtext: "Kata kata hari ini",
                      ),
                      SizedBox(width: 60, height: 40),
                      ProfileCard(
                        username: "Arsya / 9 / IX PPLG 2",
                        imagePath: "assets/image/arsya.jpg",
                        subtext: "Kata kata hari ini",
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

              Positioned(
                bottom: 35,
                left: 0,
                right: 0,
                child: Center(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
