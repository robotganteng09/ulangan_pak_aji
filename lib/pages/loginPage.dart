import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:ulangan_pak_aji/controller/login_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/widgets/textfieldReuse.dart';

class Loginpage extends StatelessWidget {
  LoginController logincontroller = Get.put(LoginController());
  Loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              // Image.asset("assets/image/img1.jpeg"),
              ReuseTextField(
                label: "nama",
                controller: logincontroller.txtUser,
                isNUmber: false,
              ),
              SizedBox(height: 24),

              ReuseTextField(
                label: "password",
                controller: logincontroller.txtPassword,
                isNUmber: true,
              ),
              SizedBox(height: 20),
              CustomButton(text: "LOGIN", onPressed: logincontroller.login),
            ],
          ),
        ),
      ),
    );
  }
}
