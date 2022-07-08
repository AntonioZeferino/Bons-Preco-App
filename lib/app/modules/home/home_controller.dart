import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/produto_list.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final box = GetStorage('BonsPreco');
  TextEditingController searchCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final repository = ProdutoRepository();

  RxList<ProdutoList> listProduto = <ProdutoList>[].obs;
  RxList<ProdutoList> listProdutoRecentes = <ProdutoList>[].obs;
  RxList<ProdutoList> listProdutoTop = <ProdutoList>[].obs;
  User user = User();

  @override
  void onInit() {
    listProdutos();
    super.onInit();
  }

  @override
  void onReady() {
    // listProdutos();
    super.onReady();
  }

  pegarPesquisar(String value) {
    box.write('pesquis', value);
    Get.toNamed(Routes.SEARCH);
  }

  listProdutos() async {
    var produt;
    listProduto.clear();

    Conexao().verificaConexao();
    if (Conexao().net.value) {
      produt = await repository.produtoListSelect();
      listProduto.value = produt != null ? await produt : [];
      if (listProduto.isNotEmpty) {
        for (var i = 0; i < listProduto.length; i++) {
          if (i <= 5) {
            listProdutoRecentes.add(listProduto[i]);
          }
        }
        listProdutoTop = listProduto;
        listProdutoTop.sort((a, b) => b.total!.compareTo(a.total!));
      }
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
