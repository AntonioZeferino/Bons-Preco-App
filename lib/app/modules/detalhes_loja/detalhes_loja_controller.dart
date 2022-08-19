import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/produto_da_loja.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DetalhesLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  Parceiro parceiro = Parceiro();
  String img = "";
  String titulo = "";
  String nLojas = "";
  User user = User();

  final repository = ProdutoRepository();
  RxList<produtoDaLoja> listProduto = <produtoDaLoja>[].obs;
  RxString token = ''.obs;

  @override
  void onInit() {
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));
      token.value = box.read('accessToken');
    }
    parceiro = box.read("Parceiro");
    pegarProduto(parceiro.id!.toInt());
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  pegarProduto(int id) async {
    var produto = await repository.produtoDaLojaSelect(id);
    listProduto.value = produto != null ? await produto : [];
  }
}
