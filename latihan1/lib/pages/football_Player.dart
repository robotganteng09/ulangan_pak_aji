import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/football_player_controller.dart';
import 'package:latihan1/routes/routes.dart';

class FootballPlayer extends StatelessWidget {
  FootballPlayer({super.key});

  final footballPlayerController = Get.find<FootballPlayerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Football Players"), centerTitle: true),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Obx(
          () => ListView.builder(
            itemCount: footballPlayerController.players.length,
            itemBuilder: (context, index) {
              final player = footballPlayerController.players[index];
              return ListTile(
                leading: Image.asset(player.imageAsset, width: 50, height: 50),
                title: Text(player.name),
                subtitle: Text("${player.position}  Number ${player.number}"),
                onTap: () {
                  Get.toNamed(AppRoutes.footballeditor, arguments: index);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
