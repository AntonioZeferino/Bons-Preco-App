import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MinhasReservasController extends GetxController {
  final box = GetStorage('BonsPreco');
  String img = "";
  String titulo = "";
  String nLojas = "";
  RxInt res = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
