import 'package:get/get.dart';

import 'bemvindo_controller.dart';

class BemvindoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BemvindoController>(() => BemvindoController());
  }
}
