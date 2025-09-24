import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulangan_pak_aji/routes/route.dart';

class SplashScreenController extends GetxController {
  void onInit() {
    super.onInit();
    checkLogin();
  }

  checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("username") != null) {
      Future.delayed(Duration(seconds: 5));
      Get.offAllNamed(AppRoutes.Dashboard);
    } else {
      Get.offAllNamed(AppRoutes.Dashboard);
    }
  }
}
