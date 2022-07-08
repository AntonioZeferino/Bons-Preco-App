import 'dart:convert';
import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  registerParceiro(Parceiro parceiro, String token) async {
    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'parceiroStore'));

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['nome'] = parceiro.nome.toString();
      request.fields['img'] = parceiro.img.toString();
      request.fields['horario'] = parceiro.horario.toString();
      request.fields['entregas'] = parceiro.entregas.toString();
      request.fields['endereco'] = parceiro.endereco.toString();
      request.fields['contacto'] = parceiro.contacto.toString();
      request.fields['email'] = parceiro.email.toString();

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

  updateParceiro(Parceiro parceiro, String token) async {
    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'parceiroUpdate'));

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
