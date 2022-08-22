import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/reserva.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ListProdutoLojaReserva extends StatelessWidget {
  const ListProdutoLojaReserva({
    Key? key,
    required this.idReserva,
    required this.produtId,
    required this.parceirId,
    required this.userId,
    required this.userNome,
    required this.img,
    required this.titulo,
    required this.preco,
    required this.data,
    required this.stok,
    required this.estado,
  }) : super(key: key);

  final int? idReserva;
  final int? produtId;
  final int? parceirId;
  final int? userId;
  final String? userNome;
  final String img;
  final String titulo;
  final double preco;
  final String data;
  final int stok;
  final int estado;

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("###,###.00 kz", 'pt_PT');
    final box = GetStorage('BonsPreco');
    RxBool loading = false.obs;
    RxString token = "".obs;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Get.height / 6,
        width: Get.width / 1.5,
        margin: EdgeInsets.only(
          left: Get.width / 55,
          right: Get.width / 55,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //IMG
            Container(
              height: Get.height / 8,
              width: Get.width / 4,
              margin: EdgeInsets.only(
                //bottom: Get.height / 80,
                left: Get.width / 30,
              ),
              decoration: BoxDecoration(
                color: Layout.primary(),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/$img'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //Preco, Titulo, Endereco
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Preco
                Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: Get.height / 30,
                    left: Get.width / 55,
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
                    left: Get.width / 55,
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
                        left: Get.width / 55,
                      ),
                      child: const Text(
                        "Cliente: ",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      width: Get.width / 2.7,
                      margin: const EdgeInsets.only(
                        top: 1,
                      ),
                      child: Text(
                        userNome.toString(),
                        style: TextStyle(
                          color: Layout.primary(),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Icon Reservar
            IconButton(
              onPressed: () async {
                bool res = false;
                Reserva reserva = Reserva();
                ReservaRepository repository = ReservaRepository();

                if (idReserva != 0) {
                  reserva.id = idReserva;
                  reserva.estado = estado + 1;

                  Conexao().verificaConexao();
                  if (Conexao().net.value) {
                    res = await repository.reservaUpdateEstado(
                        reserva, token.value);
                  } else {
                    Get.snackbar(
                      'Sem Internet',
                      "verifica sua conexão com a internet!",
                      snackPosition: SnackPosition.TOP,
                      colorText: Layout.primaryWhite(),
                      backgroundColor: Layout.danger(),
                    );
                  }

                  if (res) {
                    Conexao().dialogSMS('Reserva', 'Actualizado com sucesso!');
                  } else {
                    print("Errado Res: " + res.toString());
                  }
                } else {
                  Conexao().dialogSMS('Reserva', 'Preencha todos os campos!');
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
