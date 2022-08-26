import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/produto_da_loja.dart';
import 'package:bompreco/app/data/model/produto_loja.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProdutoLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  final String rootProduto = Conexao().getImgProduto();
  String img = "";
  String titulo = "";
  String nLojas = "";
  RxString token = ''.obs;
  User user = User();

  final repository = ProdutoRepository();
  RxList<produtoLoja> listProduto = <produtoLoja>[].obs;

  int id = 0;

  @override
  void onInit() {
    id = box.read("ProdutoID");
    pegarProduto(id);
    pegar();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  pegar() {
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));

      token.value = box.read('accessToken');
    }
    img = box.read("img");
    titulo = box.read("titulo");
    nLojas = box.read("nLojas");
  }

  pegarProduto(int id) async {
    var produto = await repository.produtoLojasSelect(id);
    listProduto.value = produto != null ? await produto : [];
  }
}
