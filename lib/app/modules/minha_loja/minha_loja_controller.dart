import 'dart:async';

import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/loja.reserva.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MinhaLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  User user = User();

  Parceiro parceiro = Parceiro();
  //RxList<Parceiro> listParceiro = <Parceiro>[].obs;
  final String rootParceiro = Conexao().getImgParceiro();

  final repository = ReservaRepository();
  RxList<LojaReserva> listLoja = <LojaReserva>[].obs;
  RxList<LojaReserva> listReserva = <LojaReserva>[].obs;
  RxList<LojaReserva> listAceites = <LojaReserva>[].obs;
  RxList<LojaReserva> listProcessada = <LojaReserva>[].obs;
  RxList<LojaReserva> listTerminados = <LojaReserva>[].obs;
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
    parceiro = box.read("Parceiro");
    pegarReserva(parceiro.id!, token.value);
    startSplashScreenTimer();
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

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, verificarReserva);
  }

  verificarReserva() {
    for (var i = 0; i < listLoja.length; i++) {
      if (listLoja[i].estado == 1) {
        listReserva.add(listLoja[i]);
      } else if (listLoja[i].estado == 2) {
        listAceites.add(listLoja[i]);
      } else if (listLoja[i].estado == 3) {
        listProcessada.add(listLoja[i]);
      } else if (listLoja[i].estado == 4) {
        listTerminados.add(listLoja[i]);
      }
    }
  }
}
