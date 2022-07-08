import 'package:bompreco/app/modules/ver_loja/ver_loja_controller.dart';
import 'package:get/get.dart';

class VerLojaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerLojaController>(() => VerLojaController());
  }
}
