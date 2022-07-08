import 'package:bompreco/app/routes/app_pages.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GetStorage.init("BonsPreco");
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Bons Preços',
    theme: appThemeData,
    initialRoute: Routes.BEMVINDO,
    getPages: AppPages.routes,
  ));
}
