import 'dart:convert';
import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthUserProvider {
  static String root = Conexao().getConexao();

  register(User user) async {
    try {
      var map = <String, dynamic>{};
      map['name'] = user.nome.toString();
      map['email'] = user.email.toString();
      map['password'] = user.password.toString();
      map['contacto'] = user.contacto.toString();

      var response = await http.post(Uri.parse(root + 'register'), body: map);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Registar', "Erro verifica os seu dados!");
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Registar',
        content: Text("$e"),
      );
      print(e);
    }
    return null;
  }

  login(String user, String passe) async {
    try {
      var map = <String, dynamic>{};
      map['email'] = user;
      map['password'] = passe;

      var response = await http.post(Uri.parse(root + 'login'), body: map);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao()
            .dialogSMS('Login', "${json.decode(response.body)['message']}");
      }
    } catch (e) {
      Get.defaultDialog(
        title: 'Login',
        content: Text("$e"),
      );
      print(e);
    }
    return null;
  }

  logout(String token) async {
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      var response =
          await http.post(Uri.parse(root + "logout"), headers: headers);

      if (200 == response.statusCode) {
        Get.snackbar(
          'Sair',
          "${json.decode(response.body)['message']}",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Layout.primaryWhite(),
          backgroundColor: Layout.success(),
        );
        return true;
      } else {
        Conexao().dialogSMS('Sair', "Erro ao sair!");
        return false;
      }
    } catch (e) {
      print('Erro no Logout:: $e');
    }
  }

  me(String? token) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      response = await http.post(Uri.parse(root + "me"), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Get.snackbar(
          'Erro',
          "${json.decode(response.body)['message']}",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Layout.primaryWhite(),
          backgroundColor: Layout.success(),
        );
      }
    } catch (e) {
      print('Erro User me $e');
    }
    return null;
  }

  updateUser(User user, String token) async {
    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'userUpdate'));

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id'] = user.id.toString();
      request.fields['nome'] = user.nome.toString();
      request.fields['email'] = user.email.toString();
      request.fields['contacto'] = user.contacto.toString();
      if (user.password.toString().isNotEmpty && user.password != null) {
        request.fields['password'] = user.password.toString();
      }
      request.fields['gestor'] = user.gestor.toString();

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
}
