import 'dart:async';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:get/get.dart';

class BemvindoController extends GetxController {
  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationToNextPage);
  }

  void navigationToNextPage() {
    Get.offAllNamed(Routes.HOME);
  }
}
