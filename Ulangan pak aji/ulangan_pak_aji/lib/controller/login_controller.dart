import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

class LoginController extends GetxController {
  final txtUser = TextEditingController();
  final txtPassword = TextEditingController();

  final user = "admin";
  final password = "12345";

  login() async {
    if (txtUser.text == user && txtPassword.text == password) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", txtUser.text.toString());
      Get.offNamed(AppRoutes.DashboardWidePage);
    } else {
      Get.snackbar("Login Gagal", "password salaah");
    }
  }

  logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("username");
    Get.offAllNamed(AppRoutes.Splashscreen);
  }

  @override
  void onClose() {
    txtUser.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
