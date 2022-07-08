import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MinhaLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  String img = "";
  String titulo = "";
  String nLojas = "";
  RxInt res = 0.obs;

  @override
  void onInit() {
    pegar();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  pegar() {
    img = box.read("img");
    titulo = box.read("titulo");
    nLojas = box.read("nLojas");
  }
}
