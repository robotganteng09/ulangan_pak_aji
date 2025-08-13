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
      name: "Sesko",
      position: "Forward",
      number: 9,
      imageAsset: "assets/images/plane.png",
    ),
    Player(
      name: "Mbeumo",
      position: "Forward",
      number: 19,
      imageAsset: "assets/images/plane.png",
    ),
    Player(
      name: "Cunha",
      position: "Forward",
      number: 12,
      imageAsset: "assets/images/plane.png",
    ),
    Player(
      name: "Amad",
      position: "Winger",
      number: 11,
      imageAsset: "assets/images/plane.png",
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
