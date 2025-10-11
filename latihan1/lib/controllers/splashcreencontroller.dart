import 'package:get/get.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashcreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }
}

checklogin() async {
  await Future.delayed(Duration(seconds: 1));
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getString("username") != null) {
    Get.offAllNamed(AppRoutes.bottomNav);
  } else {
    Get.offAllNamed(AppRoutes.LoginPage);
  }
}
