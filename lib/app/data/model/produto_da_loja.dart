class produtoDaLoja {
  int? produtoId;
  int? parceiroId;
  String? produtoNome;
  String? produtoImg;
  int? preco;
  String? dataValidad;
  int? estadoStok;

  produtoDaLoja({
    this.produtoId,
    this.parceiroId,
    this.produtoNome,
    this.produtoImg,
    this.preco,
    this.dataValidad,
    this.estadoStok,
  });

  produtoDaLoja.fromJson(Map<String, dynamic> json) {
    produtoId = json['produto_id'];
    parceiroId = json['parceiro_id'];
    produtoNome = json['produto_nome'];
    produtoImg = json['produto_img'];
    preco = json['preco'];
    dataValidad = json['data_validad'];
    estadoStok = json['estado_stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['produto_id'] = produtoId;
    data['parceiro_id'] = parceiroId;
    data['produto_nome'] = produtoNome;
    data['produto_img'] = produtoImg;
    data['preco'] = preco;
    data['data_validad'] = dataValidad;
    data['estado_stok'] = estadoStok;
    return data;
  }
}
