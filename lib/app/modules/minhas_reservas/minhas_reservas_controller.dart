import 'package:bompreco/app/data/model/reserva.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/model/user_reserva.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MinhasReservasController extends GetxController {
  final box = GetStorage('BonsPreco');
  String img = "";
  String titulo = "";
  String nLojas = "";
  RxInt res = 0.obs;

  User user = User();

  Reserva reserva = Reserva();
  RxList<UserReserva> listUserReserva = <UserReserva>[].obs;
  RxList<UserReserva> listSelecionado = <UserReserva>[].obs;
  RxList<UserReserva> listEnviado = <UserReserva>[].obs;
  RxList<UserReserva> listAceite = <UserReserva>[].obs;
  ReservaRepository repository = ReservaRepository();

  //static String root = Conexao().getImgUser();
  RxString token = ''.obs;

  @override
  void onInit() {
    if (box.read('user') != null) {
      user = User.fromJson(box.read('user'));
      token.value = box.read('accessToken');
    }
    pegarUserReserva(user.id!, token.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  pegarUserReserva(int id, String token) async {
    var reserva = await repository.userReservaSelect(id, token);
    listUserReserva.value = reserva != null ? await reserva : [];

    for (var i = 0; i < listUserReserva.length; i++) {
      if (listUserReserva[i].estado == 0) {
        listSelecionado.add(listUserReserva[i]);
      } else if (listUserReserva[i].estado == 1) {
        listEnviado.add(listUserReserva[i]);
      } else if (listUserReserva[i].estado == 2) {
        listAceite.add(listUserReserva[i]);
      }
    }
  }
}
