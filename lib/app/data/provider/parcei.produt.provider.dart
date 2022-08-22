import 'dart:convert';
import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parcei_produt.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ParceiProdutProvider {
  static String root = Conexao().getConexao();

  getAll() async {
    http.Response response;
    try {
      var headers = {
        'Content-Type': 'application/json',
      };

      response =
          await http.post(Uri.parse(root + "parceiprodut"), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Parceiros Produtos', "Erro Parceiros Produtos");
      }
    } catch (e) {
      print('Erro Parceiros Produtos $e');
    }
    return null;
  }

  getAllID(int id) async {
    http.Response response;
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      final body = {
        'id': id,
      };

      response = await http.post(Uri.parse(root + "parceiprodut"),
          body: json.encode(body), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Parceiros Produtos', "Erro Parceiros Produtos");
      }
    } catch (e) {
      print('Erro Parceiros Produtos $e');
    }
    return null;
  }

  getAllParceiDoProdut(int parc, String token) async {
    http.Response response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      final body = {'idpar': parc};

      response = await http.post(Uri.parse(root + "produtDoParceiro"),
          headers: headers, body: json.encode(body));

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Parceiro Produto', "Erro Parceiro Produto");
      }
    } catch (e) {
      print('Erro Reservas $e');
    }
    return null;
  }

  registerParceiProd(ParceiProdut parProd, String token) async {
    try {
      http.MultipartRequest request =
          http.MultipartRequest("POST", Uri.parse(root + 'parceiprodutStore'));

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id_produto'] = parProd.idProduto.toString();
      request.fields['id_parceiro'] = parProd.idParceiro.toString();
      request.fields['preco'] = parProd.preco.toString();
      request.fields['data_validad'] = parProd.dataValidad.toString();
      request.fields['estado_stok'] = parProd.estadoStok.toString();

      http.StreamedResponse response = await request.send();

      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS('Registrar', "Erro ao enviar a Mensagem!");
        return false;
      }
    } catch (e) {
      print('Erro Mensagem $e');
    }
    return null;
  }

  updateParceiProd(ParceiProdut parProd, String token) async {
    try {
      http.MultipartRequest request = new http.MultipartRequest(
          "POST", Uri.parse(root + 'parceiprodutUpdate'));

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id_produto'] = parProd.idProduto.toString();
      request.fields['id_parceiro'] = parProd.idParceiro.toString();
      request.fields['preco'] = parProd.preco.toString();
      request.fields['data_validad'] = parProd.dataValidad.toString();
      request.fields['estado_stok'] = parProd.estadoStok.toString();

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

  apagarParceiProd(ParceiProdut parProd, String token) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      response = await http.delete(
        Uri.parse(root + "parceiprodut/${parProd.id}"),
        headers: headers,
      );

      if (json.decode(response.body)['status']) {
        Conexao().dialogSMS('Apagar', "Parceiros Produtos Eliminado!");
        return true;
      } else {
        Conexao().dialogSMS('Apagar', "Parceiros Produtos não Eliminado");
        return false;
      }
    } catch (e) {
      print('Erro Parceiros Produtos $e');
    }
    return false;
  }
}
