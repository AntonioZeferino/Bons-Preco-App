import 'dart:async';

import 'package:bompreco/app/data/model/loja.reserva.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/produto.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/parcei.produt.repository.dart';
import 'package:bompreco/app/data/repository/produto.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddProdutoLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  Produto produto = Produto();
  RxList<Produto> listProduto = <Produto>[].obs;
  RxList<Produto> listProduto1 = <Produto>[].obs;
  ProdutoRepository repository = ProdutoRepository();

  final repositoryReserva = ParceiProdutRepository();
  RxList<LojaReserva> listProdLoja = <LojaReserva>[].obs;

  User user = User();
  RxString token = ''.obs;

  Parceiro parceiro = Parceiro();

  String img = "";
  String titulo = "";
  String nLojas = "";
  RxInt res = 0.obs;

  @override
  void onInit() {
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));
      token.value = box.read('accessToken');
    }
    parceiro = box.read("Parceiro");
    pegarProdutSistema();
    pegarReserva(parceiro.id!, token.value);

    super.onInit();
  }

  @override
  void onReady() {
    startSplashScreenTimer();
    super.onReady();
  }

  pegarProdutSistema() async {
    var produto = await repository.produtoSelect();
    listProduto1.value = produto != null ? await produto : [];
  }

  pegarReserva(int id, String token) async {
    var reserva = await repositoryReserva.lojaParceiProdutSelect(id, token);
    listProdLoja.value = reserva != null ? await reserva : [];
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, verificarProduto);
  }

  verificarProduto() {
    int cont = 0;
    for (var i = 0; i < listProduto1.length; i++) {
      for (var j = 0; j < listProdLoja.length; j++) {
        if (listProduto1[i].id == listProdLoja[j].idProduto) {
          cont = 1;
        }
      }
      if (cont == 0) {
        listProduto.add(listProduto1[i]);
      } else {
        cont = 0;
      }
    }
  }
}
