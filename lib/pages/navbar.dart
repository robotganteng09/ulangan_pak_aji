import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/nav_controller.dart';

class Navbar extends StatelessWidget {
  NavController navController = Get.put(NavController());
  Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: navController.pages[navController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.selectedIndex.value,
          onTap: navController.changeTab,
          items: const[
            BottomNavigationBarItem(icon:Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.note),label: "Dashboard"),
            BottomNavigationBarItem(icon: Icon(Icons.history),label: "History")
          ],
        ),
      ),
    );
  }
}
