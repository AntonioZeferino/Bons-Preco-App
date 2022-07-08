import 'package:bompreco/app/modules/detalhes_loja/detalhes_loja_controller.dart';
import 'package:bompreco/app/modules/minha_loja/minha_loja_controller.dart';
import 'package:get/get.dart';

class MinhaLojaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MinhaLojaController>(() => MinhaLojaController());
  }
}
