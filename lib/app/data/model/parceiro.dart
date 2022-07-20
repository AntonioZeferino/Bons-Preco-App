class Parceiro {
  int? id;
  int? donoIdUser;
  String? nome;
  String? img;
  String? horario;
  int? entregas;
  String? endereco;
  String? contacto;
  String? email;

  Parceiro(
      {this.id,
      this.donoIdUser,
      this.nome,
      this.img,
      this.horario,
      this.entregas,
      this.endereco,
      this.contacto,
      this.email});

  Parceiro.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    donoIdUser = json['dono_id_user'];
    nome = json['nome'];
    img = json['img'];
    horario = json['horario'];
    entregas = json['entregas'];
    endereco = json['endereco'];
    contacto = json['contacto'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['dono_id_user'] = donoIdUser;
    data['nome'] = nome;
    data['img'] = img;
    data['horario'] = horario;
    data['entregas'] = entregas;
    data['endereco'] = endereco;
    data['contacto'] = contacto;
    data['email'] = email;
    return data;
  }
}
