import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/MainmenuController.dart';

class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});
  final mainmenuController = Get.find<MainmenuController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text("")),
        body: mainmenuController.pages[mainmenuController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          //memanggil fungsi change page dari controller
          onTap: mainmenuController.changePage,
          //mencari index
          currentIndex: mainmenuController.selectedIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded),
              label: "Calculator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Player List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
