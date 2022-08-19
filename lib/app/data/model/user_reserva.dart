class UserReserva {
  int? idReserva;
  int? idProduto;
  int? idParceiro;
  int? idUser;
  int? estado;
  String? produtNome;
  String? produtImg;
  String? parceiNome;

  UserReserva(
      {this.idReserva,
      this.idProduto,
      this.idParceiro,
      this.idUser,
      this.estado,
      this.produtNome,
      this.produtImg,
      this.parceiNome});

  UserReserva.fromJson(Map<String, dynamic> json) {
    idReserva = json['id_reservas'];
    idProduto = json['id_produto'];
    idParceiro = json['id_parceiro'];
    idUser = json['id_user'];
    estado = json['estado'];
    produtNome = json['produto_nome'];
    produtImg = json['produto_img'];
    parceiNome = json['parceiro_nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_reservas'] = idReserva;
    data['id_produto'] = idProduto;
    data['id_parceiro'] = idParceiro;
    data['id_user'] = idUser;
    data['estado'] = estado;
    data['produto_nome'] = produtNome;
    data['produto_img'] = produtImg;
    data['parceiro_nome'] = parceiNome;
    return data;
  }
}
