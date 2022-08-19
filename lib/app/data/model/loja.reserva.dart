class LojaReserva {
  int? idReservas;
  int? idProduto;
  int? idParceiro;
  int? idUser;
  int? estado;
  String? prodNome;
  String? prodImg;
  double? preco;
  String? dataValidad;
  int? estadoStok;

  LojaReserva(
      {this.idReservas,
      this.idProduto,
      this.idParceiro,
      this.idUser,
      this.estado,
      this.prodNome,
      this.prodImg,
      this.preco,
      this.dataValidad,
      this.estadoStok});

  LojaReserva.fromJson(Map<String, dynamic> json) {
    idReservas = json['id_reservas'];
    idProduto = json['id_produto'];
    idParceiro = json['id_parceiro'];
    idUser = json['id_user'];
    estado = json['estado'];
    prodNome = json['produto_nome'];
    prodImg = json['produto_img'];
    preco = json['preco'];
    dataValidad = json['data_validad'];
    estadoStok = json['estado_stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id_reservas'] = idReservas;
    data['id_produto'] = idProduto;
    data['id_parceiro'] = idParceiro;
    data['id_user'] = idUser;
    data['estado'] = estado;
    data['produto_nome'] = prodNome;
    data['produto_img'] = prodImg;
    data['preco'] = preco;
    data['data_validad'] = dataValidad;
    data['estado_stok'] = estadoStok;
    return data;
  }
}
