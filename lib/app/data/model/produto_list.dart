class ProdutoList {
  int? id;
  String? nome;
  String? img;
  int? total;

  ProdutoList({
    this.id,
    this.nome,
    this.img,
    this.total,
  });

  ProdutoList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    img = json['img'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['img'] = img;
    data['total'] = total;
    return data;
  }
}
