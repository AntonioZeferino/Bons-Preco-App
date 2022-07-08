import 'package:bompreco/app/modules/registra_produto/registra_produto_controller.dart';
import 'package:get/get.dart';

class RegistraProdutoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistraProdutoController>(() => RegistraProdutoController());
  }
}
