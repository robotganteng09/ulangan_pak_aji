import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/logincontroller.dart';
import 'package:latihan1/widgets/widgetcomponents.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<Logincontroller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("assets/images/naren.jpg"),
            ),
            const SizedBox(height: 20),

            const Text(
              "Nama: Narendra Dhanadyata",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const Text(
              "Kelas: XI PPLG 2",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),

            CustomButton(
              text: "Logout",
              onPressed: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
