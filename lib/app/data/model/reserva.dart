class Reserva {
  int? id;
  int? idProduto;
  int? idParceiro;
  int? idUser;
  int? estado;
  Null? createdAt;
  Null? updatedAt;

  Reserva(
      {this.id,
      this.idProduto,
      this.idParceiro,
      this.idUser,
      this.estado,
      this.createdAt,
      this.updatedAt});

  Reserva.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduto = json['id_produto'];
    idParceiro = json['id_parceiro'];
    idUser = json['id_user'];
    estado = json['estado'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['id_produto'] = idProduto;
    data['id_parceiro'] = idParceiro;
    data['id_user'] = idUser;
    data['estado'] = estado;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
