import 'package:bompreco/app/modules/criar_loja/criar_loja_controller.dart';
import 'package:get/get.dart';

class CriarLojaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CriarLojaController>(() => CriarLojaController());
  }
}
