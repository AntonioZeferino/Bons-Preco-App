class Produto {
  int? id;
  String? nome;
  String? img;

  Produto({
    this.id,
    this.nome,
    this.img,
  });

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['img'] = img;
    return data;
  }
}
