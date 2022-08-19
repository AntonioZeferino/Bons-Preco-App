import 'package:bompreco/app/data/model/loja.reserva.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/parcei.produt.repository.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MinhaLojaController extends GetxController {
  final box = GetStorage('BonsPreco');
  User user = User();

  Parceiro parceiro = Parceiro();
  //RxList<Parceiro> listParceiro = <Parceiro>[].obs;

  final repository = ParceiProdutRepository();
  RxList<LojaReserva> listReserva = <LojaReserva>[].obs;
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
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  pegarReserva(int id, String token) async {
    var reserva = await repository.lojaParceiProdutSelect(id, token);
    listReserva.value = reserva != null ? await reserva : [];
  }
}
