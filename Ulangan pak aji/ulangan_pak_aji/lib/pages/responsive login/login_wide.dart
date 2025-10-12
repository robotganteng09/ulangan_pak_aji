import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class LoginpageWide extends StatelessWidget {
  final LoginController logincontroller = Get.find<LoginController>();
  LoginpageWide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          // 🟩 LEFT SIDE
          Expanded(
            child: Container(
              color: Colors.grey[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle, color: AppColors.neon, size: 90),
                  const SizedBox(height: 16),
                  Text(
                    "Welcome Back\nto Ulangan Pak Aji",
                    style: TextStyle(
                      color: AppColors.textLight,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Manage your learning tasks,\ntrack progress, and stay productive.",
                    style: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 13,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // 🟦 RIGHT SIDE
          Expanded(
            child: Center(
              child: Container(
                width: 340,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppColors.textLight,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // 🔸 Semua input & tombol dibungkus di dalam Container
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          // Username field
                          ReuseTextField(
                            label: "Username",
                            controller: logincontroller.txtUser,
                            isNUmber: false,
                            fillColor: AppColors.textLight,
                            borderColor: AppColors.neon,
                            textColor: AppColors.background,
                            labelColor: AppColors.textGrey,
                          ),

                          // Password field
                          ReuseTextField(
                            label: "Password",
                            controller: logincontroller.txtPassword,
                            obscureText: true,
                            isNUmber: false,
                            fillColor: AppColors.textLight,
                            borderColor: AppColors.neon,
                            textColor: AppColors.background,
                            labelColor: AppColors.textGrey,
                          ),

                          // Sign in button
                          CustomButton(
                            text: "Sign In",
                            backgroundColor: AppColors.neon,
                            textColor: AppColors.background,
                            onPressed: logincontroller.login,
                          ),
                        ],
                      ),
                    ),

                    // Sign up text
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text.rich(
                        TextSpan(
                          text: "Don’t have an account? ",
                          style: TextStyle(
                            color: AppColors.textGrey,
                            fontSize: 12,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                color: AppColors.neon,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
