import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';
import 'package:ulangan_pak_aji/widgets/app_colors.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class Loginpage extends StatelessWidget {
  final logincontroller = Get.find<LoginController>();
  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            

              Container(
                child: Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: AppColors.textLight,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                child: ReuseTextField(
                  label: "Username",
                  controller: logincontroller.txtUser,
                  isNUmber: false,
                  fillColor: Colors.grey[900],
                  borderColor: AppColors.neon,
                  textColor: AppColors.textLight,
                  labelColor: AppColors.textGrey,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 16),
                child: ReuseTextField(
                  label: "Password",
                  controller: logincontroller.txtPassword,
                  obscureText: true,
                  isNUmber: false,
                  fillColor: Colors.grey[900],
                  borderColor: AppColors.neon,
                  textColor: AppColors.textLight,
                  labelColor: AppColors.textGrey,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 24),
                child: CustomButton(
                  text: "Sign In",
                  backgroundColor: AppColors.neon,
                  textColor: AppColors.background,
                  onPressed: logincontroller.login,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text.rich(
                  TextSpan(
                    text: "Don’t have an account? ",
                    style: TextStyle(color: AppColors.textGrey),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
