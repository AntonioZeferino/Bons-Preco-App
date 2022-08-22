class lojasLigadasProduto {
  int? produtoId;
  int? parceiroId;
  String? parceiroNome;
  int? preco;
  String? dataValidad;
  int? estadoStok;

  lojasLigadasProduto({
    this.produtoId,
    this.parceiroId,
    this.parceiroNome,
    this.preco,
    this.dataValidad,
    this.estadoStok,
  });

  lojasLigadasProduto.fromJson(Map<String, dynamic> json) {
    produtoId = json['produto_id'];
    parceiroId = json['parceiro_id'];
    parceiroNome = json['parceiro_nome'];
    preco = json['preco'];
    dataValidad = json['data_validad'];
    estadoStok = json['estado_stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['produto_id'] = produtoId;
    data['parceiro_id'] = parceiroId;
    data['parceiro_nome'] = parceiroNome;
    data['preco'] = preco;
    data['data_validad'] = dataValidad;
    data['estado_stok'] = estadoStok;
    return data;
  }
}
