import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/produto_list.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SearchController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController searchCtrl = TextEditingController();
  final box = GetStorage('BonsPreco');
  final repository = ProdutoRepository();

  RxList<ProdutoList> listProduto = <ProdutoList>[].obs;
  User user = User();

  @override
  void onInit() {
    // if (box.read('pesquis').toString().isNotEmpty) {
    //   listProdutosPesquis(box.read('pesquis').toString());
    //   searchCtrl.text = box.read('pesquis').toString();
    // } else {
    //   listProdutos();
    // }
    super.onInit();
  }

  @override
  void onReady() {
    if (box.read('pesquis').toString().isNotEmpty) {
      searchCtrl.text = box.read('pesquis').toString();
      listProdutosPesquis(box.read('pesquis').toString());
      box.write('pesquis', '');
    } else {
      listProdutos();
    }
    super.onReady();
  }

  listProdutos() async {
    var produt;
    listProduto.clear();

    Conexao().verificaConexao();
    if (Conexao().net.value) {
      produt = await repository.produtoListSelect();
      listProduto.value = produt != null ? await produt : [];
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

  listProdutosPesquis(String pesquis) async {
    var produt;
    listProduto.clear();
    print('Pesquisar = ' + pesquis);

    Conexao().verificaConexao();
    if (searchCtrl.text.isNotEmpty) {
      if (Conexao().net.value) {
        produt = await repository.produtoPesquisaSelect(pesquis);
        listProduto.value = produt != null ? await produt : [];
      } else {
        Get.snackbar(
          'Sem Internet',
          "verifica sua conexão com a internet!",
          snackPosition: SnackPosition.TOP,
          colorText: Layout.primaryWhite(),
          backgroundColor: Layout.danger(),
        );
      }
    } else {
      listProdutos();
    }
  }
}
