import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logincontroller extends GetxController {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  login() async {
    if (usernamecontroller.text == "admin" &&
        passwordcontroller.text == "123") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernamecontroller.text.toString());
      Get.offAllNamed(AppRoutes.bottomNav);
    } else {
      Get.snackbar("Login Gagal", "Username atau password salah");
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.offAllNamed(AppRoutes.Splashcreen);
  }
}
