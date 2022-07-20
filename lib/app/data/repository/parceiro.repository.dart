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

  parceiroSelectUser(int id, String token) async {
    List<Parceiro> list = <Parceiro>[];
    var response = await api.getAllUser(id, token);
    print("User Respons=" + Parceiro.fromJson(response).toString());
    response.forEach((e) {
      list.add(Parceiro.fromJson(e));
    });

    return list;
  }

  parceiroInsert(Parceiro parceiro, XFile img, String token) async {
    bool json = await api.registerParceiro(parceiro, img, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  parceiroUpdate(Parceiro parceiro, XFile img, String token) async {
    bool json = await api.updateParceiro(parceiro, img, token);
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
