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
          decoration: BoxDecoration(
            color: Layout.primary(),
            // image: const DecorationImage(
            //   image: AssetImage('assets/kesongobv.png'),
            //   fit: BoxFit.fill,
            // ),
          ),
        ),
      ),
    );
  }
}
