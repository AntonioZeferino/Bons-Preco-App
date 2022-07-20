import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bemvindo_controller.dart';

class BemvindoView extends GetView<BemvindoController> {
  const BemvindoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.startSplashScreenTimer();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          color: Layout.primaryWhite(),
          child: Container(
            margin: EdgeInsets.only(
              left: Get.width / 80,
              right: Get.width / 80,
            ),
            height: Get.height / 50,
            width: Get.width / 52,
            decoration: const BoxDecoration(
              //color: Layout.primaryDark(),
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
