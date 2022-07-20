class User {
  int? id;
  String? nome;
  String? email;
  String? password;
  String? contacto;
  String? gestor;

  User({
    this.id,
    this.nome,
    this.email,
    this.password,
    this.contacto,
    this.gestor,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    email = json['email'];
    password = json['password'];
    contacto = json['contacto'];
    gestor = json['gestor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['email'] = email;
    data['password'] = password;
    data['contacto'] = contacto;
    data['gestor'] = gestor;
    return data;
  }
}
