import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/reserva.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ListLojaPreco extends StatelessWidget {
  const ListLojaPreco({
    Key? key,
    required this.produtId,
    required this.parceirId,
    required this.userId,
    required this.titulo,
    required this.preco,
    required this.endereco,
    required this.data,
    required this.stok,
  }) : super(key: key);

  final int? produtId;
  final int? parceirId;
  final int? userId;
  final String titulo;
  final double preco;
  final String endereco;
  final String data;
  final int? stok;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    RxBool loading = false.obs;
    NumberFormat formatter = NumberFormat("###,###.00 kz", 'pt_PT');
    DateFormat formatData = DateFormat("dd/MM/yyyy");
    RxString token = "".obs;
    return GestureDetector(
      onTap: () {
        //Get.toNamed(Routes.DETALHES_LOJA);
      },
      child: Container(
        height: Get.height / 5.4,
        width: Get.width / 1.5,
        margin: EdgeInsets.only(
          left: Get.width / 55,
          right: Get.width / 95,
          top: Get.height / 95,
        ),
        decoration: BoxDecoration(
          color: Layout.primaryWhite(),
          boxShadow: [
            BoxShadow(
              color: Layout.dark(.2),
              spreadRadius: 2.0,
              blurRadius: 6.0,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Preco, Titulo, Endereco, Vencimento, Stok
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Preco
                Container(
                  margin: EdgeInsets.only(
                    bottom: 1,
                    top: Get.height / 65,
                    left: Get.width / 25,
                  ),
                  child: Text(
                    formatter.format(preco),
                    style: TextStyle(
                      color: Layout.primary(),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                //Titulo
                Container(
                  margin: EdgeInsets.only(
                    left: Get.width / 25,
                  ),
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Vencimento produtos
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: Get.width / 25,
                      ),
                      child: const Text(
                        "Vencimento: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 2,
                      ),
                      child: Text(
                        formatData.format(DateTime.parse(data)),
                        style: TextStyle(
                          color: Layout.primary(),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                //Stok produtos
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: Get.width / 25,
                      ),
                      child: const Text(
                        "Estoque: ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      stok == 1 ? "Tem" : "Terminou",
                      style: TextStyle(
                        color: stok == 1 ? Layout.primary() : Layout.danger(),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                //Endereco loja
                Container(
                  height: Get.height / 28,
                  width: Get.width / 1.4,
                  margin: EdgeInsets.only(
                    left: Get.width / 25,
                  ),
                  //padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    //color: Layout.primary(),
                    border: Border.all(
                      color: Layout.primary(),
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      endereco,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //Icon Reservar
            IconButton(
              onPressed: () async {
                Reserva reserva = Reserva();
                ReservaRepository repository = ReservaRepository();
                token.value = box.read('accessToken');

                if (userId != 0 && userId != null) {
                  bool res = false;
                  if (parceirId != 0 && parceirId != 0 && userId != 0) {
                    loading.value = true;
                    reserva.idProduto = produtId;
                    reserva.idParceiro = parceirId;
                    reserva.idUser = userId;
                    reserva.estado = 0;

                    Conexao().verificaConexao();
                    if (Conexao().net.value) {
                      res =
                          await repository.reservaInsert(reserva, token.value);
                    } else {
                      Conexao().snackbarSMS(
                          'Sem Internet', "Verifica conexão de internet!");
                    }

                    if (res) {
                      Conexao().dialogSMS('Reserva', 'Enviado com sucesso!');
                      loading.value = false;
                    } else {
                      loading.value = false;
                      print("Erro Res: " + res.toString());
                    }
                  } else {
                    loading.value = false;
                    Conexao().dialogSMS('Reserva', 'Preencha todos os campos!');
                  }
                } else {
                  Conexao().dialogSMS(
                      'Aviso!', "Porfavor faça um Login ou Criar uma conta!");
                }
              },
              icon: const Icon(
                Icons.add_circle_outlined,
              ),
              color: Layout.primary(),
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}
