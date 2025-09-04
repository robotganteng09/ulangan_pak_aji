import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/football_player_controller.dart';
import 'package:latihan1/widgets/arrayobj.dart';

class EditPlayerController extends GetxController {
  final int index;
  final FootballPlayerController footballPlayerController = Get.find();

  late TextEditingController nameController;
  late TextEditingController positionController;
  late TextEditingController numberController;

  EditPlayerController(this.index);

  @override
  void onInit() {
    super.onInit();
    // get player data
    Player player = footballPlayerController.players[index];

    // init text controllers with current data
    nameController = TextEditingController(text: player.name);
    positionController = TextEditingController(text: player.position);
    numberController = TextEditingController(text: player.number.toString());
  }

  void saveChanges() {
    final updatedName = nameController.text;
    final updatedPosition = positionController.text;
    final updatedNumber = int.tryParse(numberController.text) ?? 0;

    footballPlayerController.updatePlayer(
      index,
      updatedName,
      updatedPosition,
      updatedNumber,
    );
  }
}
