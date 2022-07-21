import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/repository/parceiro.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VerLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  final repository = ParceiroRepository();
  RxList<Parceiro> listParceiro = <Parceiro>[].obs;

  String img = "";
  String titulo = "";
  String nLojas = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    listParceiros();
    super.onReady();
  }

  listParceiros() async {
    var parceir;
    listParceiro.clear();

    Conexao().verificaConexao();
    if (Conexao().net.value) {
      parceir = await repository.parceiroSelect();
      listParceiro.value = parceir != null ? await parceir : [];
    } else {
      Get.snackbar(
        'Sem Internet',
        "verifica sua conexão com a internet!",
        snackPosition: SnackPosition.TOP,
        colorText: Layout.primaryWhite(),
        backgroundColor: Layout.danger(),
      );
    }
  }
}
