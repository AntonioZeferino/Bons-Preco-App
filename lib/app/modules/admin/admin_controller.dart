import 'dart:async';

import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/loja.reserva.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/produto.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/parceiro.repository.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AdminController extends GetxController {
  final box = GetStorage('BonsPreco');
  User user = User();

  Parceiro parceiro = Parceiro();
  //RxList<Parceiro> listParceiro = <Parceiro>[].obs;
  final String rootParceiro = Conexao().getImgParceiro();

  RxList<Produto> listProduto = <Produto>[].obs;
  ProdutoRepository repositoryProdut = ProdutoRepository();

  final repositoryParceir = ParceiroRepository();
  RxList<Parceiro> listParceiro = <Parceiro>[].obs;

  final repository = ReservaRepository();
  RxList<LojaReserva> listLoja = <LojaReserva>[].obs;

  RxString token = ''.obs;

  String img = "";
  String titulo = "";
  String nLojas = "";
  RxInt res = 0.obs;

  @override
  void onInit() {
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));
      token.value = box.read('accessToken');
    } else {
      user.id = 0;
    }
    listParceiros();
    pegarProdutSistema();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  pegarReserva(int id, String token) async {
    var reserva = await repository.parceirReservaSelect(id, token);
    listLoja.value = reserva != null ? await reserva : [];
  }

  listParceiros() async {
    var parceir;
    listParceiro.clear();

    Conexao().verificaConexao();
    if (Conexao().net.value) {
      parceir = await repositoryParceir.parceiroSelect();
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

  pegarProdutSistema() async {
    var produto = await repositoryProdut.produtoSelect();
    listProduto.value = produto != null ? await produto : [];
  }
}
