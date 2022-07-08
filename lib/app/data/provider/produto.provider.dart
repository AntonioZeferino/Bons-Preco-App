import 'dart:convert';
import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/produto.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProdutoProvider {
  static String root = Conexao().getConexao();

  getAll() async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization': 'Bearer $token'
      };

      response = await http.post(Uri.parse(root + "produto"), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Produtos', "Erro Produto");
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  getAllLojasLigadasProduto() async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization': 'Bearer $token'
      };

      response = await http.post(Uri.parse(root + "lojasLigadasProduto"),
          headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Produtos', "Erro Produto");
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  getAllProdutoDaLoja(int id) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization': 'Bearer $token'
      };
      final body = {
        'id': id,
      };

      response = await http.post(Uri.parse(root + "produtoDaLoja"),
          body: json.encode(body), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Produtos', "Erro Produto");
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  getAllProdutoList() async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization': 'Bearer $token'
      };

      response =
          await http.post(Uri.parse(root + "produtoList"), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Produtos', "Erro Produto");
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  getAllPesquisa(String pesquis) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization': 'Bearer $token'
      };

      final body = {'pesquis': pesquis};

      response = await http.post(Uri.parse(root + "indexListPesquisa"),
          body: json.encode(body), headers: headers);

      if (200 == response.statusCode) {
        return json.decode(response.body);
      } else {
        Conexao().dialogSMS('Produtos', "Erro Produtos");
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  registerProduto(Produto produto, XFile img1, String token) async {
    // var response;
    http.MultipartFile multipartFile1;

    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'produtoStore'));

      if (img1.path.isNotEmpty) {
        multipartFile1 = await http.MultipartFile.fromPath('file1', img1.path);
        request.files.add(multipartFile1);
      }

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id'] = produto.id.toString().toString();
      request.fields['nome'] = produto.nome.toString().toString();
      request.fields['img'] = produto.img.toString();

      http.StreamedResponse response = await request.send();

      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS('Registrar', "Erro ao enviar o Produto!");
        return false;
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  atualizarProduto(Produto produto, XFile img1, String token) async {
    // var response;
    http.MultipartFile multipartFile1;

    try {
      http.MultipartRequest request =
          new http.MultipartRequest("POST", Uri.parse(root + 'produtoUpdate'));

      if (img1.path.isNotEmpty) {
        multipartFile1 = await http.MultipartFile.fromPath('file1', img1.path);
        request.files.add(multipartFile1);
      }

      request.headers['Content-Type'] = 'application/json';
      request.headers['authorization'] = 'Bearer $token';

      request.fields['id'] = produto.id.toString().toString();
      request.fields['nome'] = produto.nome.toString().toString();
      request.fields['img'] = produto.img.toString();

      http.StreamedResponse response = await request.send();

      if (200 == response.statusCode) {
        return true;
      } else {
        Conexao().dialogSMS('Actualizar', "Erro ao enviar o Produto!");
        return false;
      }
    } catch (e) {
      print('Erro Produtos $e');
    }
    return null;
  }

  apagarProduto(Produto produto, String token) async {
    var response;
    try {
      var headers = {
        'Content-Type': 'application/json',
        'authorization': 'Bearer $token'
      };

      response = await http.delete(
        Uri.parse(root + "produto/${produto.id}"),
        headers: headers,
      );

      if (json.decode(response.body)['status']) {
        Conexao().dialogSMS('Apagar', "Produto Eliminado!");
        return true;
      } else {
        Conexao().dialogSMS('Apagar', "Produto não Eliminado");
        return false;
      }
    } catch (e) {
      print('Erro Produto $e');
    }
    return false;
  }
}
