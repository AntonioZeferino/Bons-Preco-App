class ParceiProdut {
  int? id;
  int? idProduto;
  int? idParceiro;
  int? preco;
  String? dataValidad;
  int? estadoStok;
  Null? createdAt;
  Null? updatedAt;
  String? parceiroNome;
  String? parceiroImg;
  String? parceiroHorario;
  int? parceiroEntregas;
  String? parceiroEndereco;
  String? parceiroContacto;
  String? parceiroEmail;

  ParceiProdut(
      {this.id,
      this.idProduto,
      this.idParceiro,
      this.preco,
      this.dataValidad,
      this.estadoStok,
      this.createdAt,
      this.updatedAt,
      this.parceiroNome,
      this.parceiroImg,
      this.parceiroHorario,
      this.parceiroEntregas,
      this.parceiroEndereco,
      this.parceiroContacto,
      this.parceiroEmail});

  ParceiProdut.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idProduto = json['id_produto'];
    idParceiro = json['id_parceiro'];
    preco = json['preco'];
    dataValidad = json['data_validad'];
    estadoStok = json['estado_stok'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    parceiroNome = json['parceiro_nome'];
    parceiroImg = json['parceiro_img'];
    parceiroHorario = json['parceiro_horario'];
    parceiroEntregas = json['parceiro_entregas'];
    parceiroEndereco = json['parceiro_endereco'];
    parceiroContacto = json['parceiro_contacto'];
    parceiroEmail = json['parceiro_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['id_produto'] = idProduto;
    data['id_parceiro'] = idParceiro;
    data['preco'] = preco;
    data['data_validad'] = dataValidad;
    data['estado_stok'] = estadoStok;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['parceiro_nome'] = parceiroNome;
    data['parceiro_img'] = parceiroImg;
    data['parceiro_horario'] = parceiroHorario;
    data['parceiro_entregas'] = parceiroEntregas;
    data['parceiro_endereco'] = parceiroEndereco;
    data['parceiro_contacto'] = parceiroContacto;
    data['parceiro_email'] = parceiroEmail;
    return data;
  }
}
