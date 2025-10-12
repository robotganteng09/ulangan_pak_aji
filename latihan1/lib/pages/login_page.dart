import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latihan1/controllers/logincontroller.dart';

import 'package:latihan1/widgets/widgetcomponents.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final controller = Get.find<Logincontroller>();

class _LoginPageState extends State<LoginPage> {
  String loginStatus = "Please fill each form";
  final TextEditingController user = TextEditingController();
  final TextEditingController password = TextEditingController();

  void handleLogin() {
    setState(() {
      if (user.text == "admin" && password.text == "123") {
        loginStatus = "Login berhasil";
      } else {
        loginStatus = "Login gagal";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page 01")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReuseTextField(
              label: "name",
              controller: controller.usernamecontroller,
              isNUmber: false,
            ),
            ReuseTextField(
              label: "password",
              controller: controller.passwordcontroller,
              isNUmber: false,
            ),
            CustomButton(
              text: "login",
              onPressed: () {
                controller.login();
              },
            ),
          ],
        ),
      ),
    );
  }
}
