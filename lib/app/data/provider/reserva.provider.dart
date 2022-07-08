import 'dart:convert';
import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/data/model/reserva.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ReservaProvider {
  static String root = Conexao().getConexao();

  getAll(String token) async {
    http.Response response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      response = await http.post(Uri.parse(root + "reserva"), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Reservas', "Erro Reservas");
      }
    } catch (e) {
      print('Erro Reservas $e');
    }
    return null;
  }

  registerParceiro(Reserva reserva, String token) async {
    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'reservaStore'));

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id_produto'] = reserva.idProduto.toString();
      request.fields['id_parceiro'] = reserva.idParceiro.toString();
      request.fields['id_user'] = reserva.idUser.toString();
      request.fields['estado'] = reserva.estado.toString();

      http.StreamedResponse response = await request.send();

      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS('Registrar', "Erro ao enviar o Mensagem!");
        return false;
      }
    } catch (e) {
      print('Erro Mensagem $e');
    }
    return null;
  }

  updateParceiro(Reserva reserva, String token) async {
    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'reservaUpdate'));

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id_produto'] = reserva.idProduto.toString();
      request.fields['id_parceiro'] = reserva.idParceiro.toString();
      request.fields['id_user'] = reserva.idUser.toString();
      request.fields['estado'] = reserva.estado.toString();

      var response = await request.send();
      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS('Actualizar',
            "Erro ao actualizar verifica os dados!${response.statusCode}");
        return false;
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Actualizar',
        content: Text("$e"),
      );
      print(e);
      return false;
    }
  }

  apagarParceiro(Reserva reserva, String token) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      response = await http.delete(
        Uri.parse(root + "reserva/${reserva.id}"),
        headers: headers,
      );

      if (json.decode(response.body)['status']) {
        Conexao().dialogSMS('Apagar', "Reservas Eliminado!");
        return true;
      } else {
        Conexao().dialogSMS('Apagar', "Reservas não Eliminado");
        return false;
      }
    } catch (e) {
      print('Erro Reservas $e');
    }
    return false;
  }
}
