import 'package:bompreco/app/modules/home/home_controller.dart';
import 'package:bompreco/app/modules/produto_loja/produto_loja_controller.dart';
import 'package:get/get.dart';

class ProdutoLojaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProdutoLojaController>(() => ProdutoLojaController());
  }
}
