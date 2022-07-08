class Parceiro {
  int? id;
  String? nome;
  String? img;
  String? horario;
  int? entregas;
  String? endereco;
  String? contacto;
  String? email;
  Null? createdAt;
  Null? updatedAt;

  Parceiro(
      {this.id,
      this.nome,
      this.img,
      this.horario,
      this.entregas,
      this.endereco,
      this.contacto,
      this.email,
      this.createdAt,
      this.updatedAt});

  Parceiro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    img = json['img'];
    horario = json['horario'];
    entregas = json['entregas'];
    endereco = json['endereco'];
    contacto = json['contacto'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['img'] = img;
    data['horario'] = horario;
    data['entregas'] = entregas;
    data['endereco'] = endereco;
    data['contacto'] = contacto;
    data['email'] = email;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
