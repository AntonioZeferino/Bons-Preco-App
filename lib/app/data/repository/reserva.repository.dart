import 'package:bompreco/app/data/model/reserva.dart';
import 'package:bompreco/app/data/provider/reserva.provider.dart';

class ReservaRepository {
  final ReservaProvider api = ReservaProvider();

  reservaSelect(Reserva reserva, String token) async {
    List<Reserva> list = <Reserva>[];
    var response = await api.getAll(token);
    response.forEach((e) {
      list.add(Reserva.fromJson(e));
    });

    return list;
  }

  reservaInsert(Reserva reserva, String token) async {
    bool json = await api.registerParceiro(reserva, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  reservaUpdate(Reserva reserva, String token) async {
    bool json = await api.updateParceiro(reserva, token);

    if (json) {
      return true;
    } else {
      return false;
    }
  }

  reservaDelete(Reserva reserva, String token) async {
    bool json = await api.apagarParceiro(reserva, token);

    print('Reservas:: $json');
    if (json) {
      return true;
    } else {
      return false;
    }
  }
}
