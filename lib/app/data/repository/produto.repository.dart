import 'package:bompreco/app/data/model/produto.dart';
import 'package:bompreco/app/data/model/produto_da_loja.dart';
import 'package:bompreco/app/data/model/produto_list.dart';
import 'package:bompreco/app/data/model/produto_loja.dart';
import 'package:bompreco/app/data/provider/produto.provider.dart';
import 'package:image_picker/image_picker.dart';

class ProdutoRepository {
  final ProdutoProvider api = ProdutoProvider();

  produtoSelect() async {
    List<Produto> list = <Produto>[];
    var response = await api.getAll();
    response.forEach((e) {
      list.add(Produto.fromJson(e));
    });

    return list;
  }

  produtoLojasLigadaSelect(Produto produto) async {
    List<Produto> list = <Produto>[];
    var response = await api.getAllLojasLigadasProduto();
    response.forEach((e) {
      list.add(Produto.fromJson(e));
    });

    return list;
  }

  produtoLojasSelect(int id) async {
    List<produtoLoja> list = <produtoLoja>[];
    var response = await api.getAllProdutoLojas(id);
    response.forEach((e) {
      list.add(produtoLoja.fromJson(e));
    });

    return list;
  }

  produtoDaLojaSelect(int id) async {
    List<produtoDaLoja> list = <produtoDaLoja>[];
    var response = await api.getAllProdutoDaLoja(id);
    response.forEach((e) {
      list.add(produtoDaLoja.fromJson(e));
    });

    return list;
  }

  produtoSoSistemaIDSelect(int id) async {
    List<Produto> list = <Produto>[];
    var response = await api.getAllProdutoSoSistemaID(id);
    response.forEach((e) {
      list.add(Produto.fromJson(e));
    });

    return list;
  }

  produtoListSelect() async {
    List<ProdutoList> list = <ProdutoList>[];
    var response = await api.getAllProdutoList();
    response.forEach((e) {
      list.add(ProdutoList.fromJson(e));
    });

    return list;
  }

  produtoPesquisaSelect(String pesquis) async {
    List<ProdutoList> list = <ProdutoList>[];
    var response = await api.getAllPesquisa(pesquis);
    response.forEach((e) {
      list.add(ProdutoList.fromJson(e));
    });

    return list;
  }

  produtoInsert(Produto produto, XFile img, String token) async {
    bool json = await api.registerProduto(produto, img, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  produtoUpdate(Produto produto, XFile img, String token) async {
    bool json = await api.atualizarProduto(produto, img, token);
    if (json) {
      return true;
    } else {
      return false;
    }
  }

  produtoDelete(Produto produto, String token) async {
    bool json = await api.apagarProduto(produto, token);

    print('Produtos:: $json');
    if (json) {
      return true;
    } else {
      return false;
    }
  }
}
