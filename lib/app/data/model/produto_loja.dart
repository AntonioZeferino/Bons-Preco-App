class produtoLoja {
  int? produtoId;
  int? parceiroId;
  int? parceiroProdutId;
  String? parceiroNome;
  String? endereco;
  int? preco;
  String? dataValidad;
  int? estadoStok;

  produtoLoja(
      {this.produtoId,
      this.parceiroId,
      this.parceiroProdutId,
      this.parceiroNome,
      this.endereco,
      this.preco,
      this.dataValidad,
      this.estadoStok});

  produtoLoja.fromJson(Map<String, dynamic> json) {
    produtoId = json['produto_id'];
    parceiroId = json['parceiro_id'];
    parceiroProdutId = json['parceiro_produt_id'];
    parceiroNome = json['parceiro_nome'];
    endereco = json['parceiro_endereco'];
    preco = json['preco'];
    dataValidad = json['data_validad'];
    estadoStok = json['estado_stok'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['produto_id'] = produtoId;
    data['parceiro_id'] = parceiroId;
    data['parceiro_produt_id'] = parceiroProdutId;
    data['parceiro_nome'] = parceiroNome;
    data['parceiro_endereco'] = endereco;
    data['preco'] = preco;
    data['data_validad'] = dataValidad;
    data['estado_stok'] = estadoStok;
    return data;
  }
}
