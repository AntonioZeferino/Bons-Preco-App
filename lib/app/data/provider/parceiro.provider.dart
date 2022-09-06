import 'dart:convert';
import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ParceiroProvider {
  static String root = Conexao().getConexao();

  getAll() async {
    http.Response response;
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      response =
          await http.post(Uri.parse(root + "parceiro"), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Parceiros', "Erro Parceiros");
      }
    } catch (e) {
      print('Erro Parceiros $e');
    }
    return null;
  }

  getAllUser(String id, String token) async {
    http.Response response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization': 'Bearer $token'
      };

      final body = {
        'id': id,
      };

      response = await http.post(Uri.parse(root + 'userParceiro'),
          body: json.encode(body), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Parceiros', "Erro Parceiros");
      }
    } catch (e) {
      print('Erro Parceiros = $e');
    }
    return null;
  }

  registerParceiro(Parceiro parceiro, XFile img1, String token) async {
    http.MultipartFile multipartFile1;
    try {
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(root + 'parceiroStore'));

      if (img1.path.isNotEmpty) {
        multipartFile1 = await http.MultipartFile.fromPath('file2', img1.path);
        request.files.add(multipartFile1);
      }

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['dono_id_user'] = parceiro.donoIdUser.toString();
      request.fields['nome'] = parceiro.nome.toString();
      request.fields['horario'] = parceiro.horario.toString();
      request.fields['entregas'] = parceiro.entregas.toString();
      request.fields['endereco'] = parceiro.endereco.toString();
      request.fields['contacto'] = parceiro.contacto.toString();
      request.fields['email'] = parceiro.email.toString();
      request.fields['img'] = parceiro.img.toString();

      http.StreamedResponse response = await request.send();

      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS('Registrar', "Erro ao enviar os dados da Loja!");
        return false;
      }
    } catch (e) {
      print('Erro Mensagem $e');
    }
    return null;
  }

  updateParceiro(Parceiro parceiro, XFile img1, String token) async {
    http.MultipartFile multipartFile1;
    try {
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(root + 'parceiroUpdate'));

      if (img1.path.isNotEmpty) {
        multipartFile1 = await http.MultipartFile.fromPath('file1', img1.path);
        request.files.add(multipartFile1);
      }

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['nome'] = parceiro.nome.toString();
      request.fields['img'] = parceiro.img.toString();
      request.fields['horario'] = parceiro.horario.toString();
      request.fields['entregas'] = parceiro.entregas.toString();
      request.fields['endereco'] = parceiro.endereco.toString();
      request.fields['contacto'] = parceiro.contacto.toString();
      request.fields['email'] = parceiro.email.toString();

      var response = await request.send();
      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS(
            'Actualizar', "Erro verifica os dados! ${response.statusCode}");
        return false;
      }
    } catch (e) {
      Conexao().dialogSMS('Actualizar', "$e");

      print(e);
      return false;
    }
  }

  apagarParceiro(Parceiro parceiro, String token) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      response = await http.delete(
        Uri.parse(root + "parceiro/${parceiro.id}"),
        headers: headers,
      );

      if (json.decode(response.body)['status']) {
        Conexao().dialogSMS('Apagar', "Parceiros Eliminado!");
        return true;
      } else {
        Conexao().dialogSMS('Apagar', "Parceiros não Eliminado");
        return false;
      }
    } catch (e) {
      print('Erro Parceiros $e');
    }
    return false;
  }
}
