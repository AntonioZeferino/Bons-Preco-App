import 'package:bompreco/app/modules/criar_conta/criar_conta_controller.dart';
import 'package:get/get.dart';

class CriarContaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CriarContaController>(() => CriarContaController());
  }
}
