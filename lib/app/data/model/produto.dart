class Produto {
  int? id;
  String? nome;
  String? img;
  String? createdAt;
  String? updatedAt;

  Produto({
    this.id,
    this.nome,
    this.img,
    this.createdAt,
    this.updatedAt,
  });

  Produto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['img'] = img;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
