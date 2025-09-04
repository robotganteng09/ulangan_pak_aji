import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/navDrawerController.dart';

class Navdrawerpage extends StatelessWidget {
  const Navdrawerpage({super.key});

  @override
  Widget build(BuildContext context) {
    final BarmenuController controller = Get.put(BarmenuController());

    return Scaffold(
      appBar: AppBar(title: Text("Nav Drawer Example")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                "My Drawer",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                controller.changePage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_soccer),
              title: Text("Football"),
              onTap: () {
                controller.changePage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                controller.changePage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.pagess,
        ),
      ),
    );
  }
}
