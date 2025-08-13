import 'package:get/get.dart';
import 'package:latihan1/widgets/arrayobj.dart';

class FootballPlayerController extends GetxController {
  var players = <Player>[
    Player(
      name: "Verstapen",
      position: "Redbull",
      number: 44,
      imageAsset: "assets/images/verstapen.jpg",
    ),
    Player(
      name: "Piastri",
      position: "Mclaren",
      number: 81,
      imageAsset: "assets/images/piastri.jpg",
    ),
    Player(
      name: "Leclerc",
      position: "Ferrari",
      number: 16,
      imageAsset: "assets/images/leclerc.jpg",
    ),
    Player(
      name: "Hamilton",
      position: "Ferrari",
      number: 44,
      imageAsset: "assets/images/hamilton.jpg",
    ),
    Player(
      name: "Alonso",
      position: "Aston Martin",
      number: 14,
      imageAsset: "assets/images/alonso.jpg",
    ),
  ].obs;

  void updatePlayer(
    int index,
    String newName,
    String newPosition,
    int newNumber,
  ) {
    players[index].name = newName;
    players[index].position = newPosition;
    players[index].number = newNumber;
    players.refresh();
  }
}
