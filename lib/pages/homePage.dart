import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/widgets/buttonReusable.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final homecontroller = Get.put(HomeController());

    return Scaffold(body: Text("halooo"));
  }
}
