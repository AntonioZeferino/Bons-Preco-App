import 'package:bompreco/app/data/model/loja.reserva.dart';
import 'package:bompreco/app/data/model/parcei_produt.dart';
import 'package:bompreco/app/data/provider/parcei.produt.provider.dart';

class ParceiProdutRepository {
  final ParceiProdutProvider api = ParceiProdutProvider();

  parceiProdutSelect() async {
    List<ParceiProdut> list = <ParceiProdut>[];
    var response = await api.getAll();
    response.forEach((e) {
      list.add(ParceiProdut.fromJson(e));
    });

    return list;
  }

  parceiProdutIDSelect(int id) async {
    List<ParceiProdut> list = <ParceiProdut>[];
    var response = await api.getAllID(id);
    response.forEach((e) {
      list.add(ParceiProdut.fromJson(e));
    });

    return list;
  }

  lojaParceiProdutSelect(int parc, String token) async {
    List<LojaReserva> list = <LojaReserva>[];
    var response = await api.getAllLojaParceiProdut(parc, token);
    response.forEach((e) {
      list.add(LojaReserva.fromJson(e));
    });

    return list;
  }

  parceiProdutInsert(ParceiProdut parceiProd, String token) async {
    bool json = await api.registerParceiProd(parceiProd, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  parceiProdutUpdate(ParceiProdut parceiProd, String token) async {
    bool json = await api.updateParceiProd(parceiProd, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  parceiProdutDelete(ParceiProdut parceiProd, String token) async {
    bool json = await api.apagarParceiProd(parceiProd, token);

    print('ParceiProdutos:: $json');
    if (json) {
      return true;
    } else {
      return false;
    }
  }
}
