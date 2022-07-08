import 'package:bompreco/app/modules/add_produto_loja/add_produto_loja_controller.dart';
import 'package:get/get.dart';

class AddProdutoLojaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProdutoLojaController>(() => AddProdutoLojaController());
  }
}
