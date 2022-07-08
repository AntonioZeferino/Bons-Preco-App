import 'package:bompreco/app/modules/detalhes_loja/detalhes_loja_controller.dart';
import 'package:get/get.dart';

class DetalhesLojaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetalhesLojaController>(() => DetalhesLojaController());
  }
}
