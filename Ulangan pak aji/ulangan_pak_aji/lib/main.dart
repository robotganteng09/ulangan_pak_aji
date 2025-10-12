import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulangan_pak_aji/controller/date_controller.dart';
import 'package:ulangan_pak_aji/controller/drop_down_controller.dart';
import 'package:ulangan_pak_aji/controller/editController.dart';
import 'package:ulangan_pak_aji/controller/home_controller.dart';
import 'package:ulangan_pak_aji/controller/responsive_controller.dart';
import 'package:ulangan_pak_aji/controller/time_controller.dart';
import 'package:ulangan_pak_aji/controller/wide_controller.dart';
import 'package:ulangan_pak_aji/routes/pages.dart';
import 'package:ulangan_pak_aji/routes/route.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null);
  Get.put(TimeController());
  Get.put(WideController());
  Get.put(DateController());
  Get.put(DropDownController());
  Get.put(EditTodoController());
  Get.put(HomeController());
  Get.put(ResponsiveController());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.Splashscreen,
      getPages: AppPage.pages,
    );
  }
}
