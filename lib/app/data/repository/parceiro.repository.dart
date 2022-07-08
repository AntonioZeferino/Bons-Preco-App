import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/produto.dart';
import 'package:bompreco/app/data/provider/parceiro.provider.dart';
import 'package:image_picker/image_picker.dart';

class ParceiroRepository {
  final ParceiroProvider api = ParceiroProvider();

  parceiroSelect() async {
    List<Parceiro> list = <Parceiro>[];
    var response = await api.getAll();
    response.forEach((e) {
      list.add(Parceiro.fromJson(e));
    });

    return list;
  }

  parceiroInsert(Parceiro parceiro, String token) async {
    bool json = await api.registerParceiro(parceiro, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  parceiroUpdate(Parceiro parceiro, String token) async {
    bool json = await api.updateParceiro(parceiro, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  parceiroDelete(Parceiro parceiro, String token) async {
    bool json = await api.apagarParceiro(parceiro, token);

    print('Produtos:: $json');
    if (json) {
      return true;
    } else {
      return false;
    }
  }
}
