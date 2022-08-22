import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/reserva.dart';
import 'package:bompreco/app/data/model/user_reserva.dart';
import 'package:bompreco/app/data/repository/reserva.repository.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListProdutoReserva extends StatelessWidget {
  const ListProdutoReserva({
    Key? key,
    required this.idReserva,
    required this.idProduto,
    required this.idParceiro,
    required this.idUser,
    required this.estado,
    required this.produtImg,
    required this.produtNome,
    required this.parceiNome,
  }) : super(key: key);

  final int idReserva;
  final int idProduto;
  final int idParceiro;
  final int idUser;
  final int estado;
  final String produtImg;
  final String produtNome;
  final String parceiNome;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    RxString token = ''.obs;
    token.value = box.read('accessToken');
    return GestureDetector(
      onTap: () {
        //Get.toNamed(Routes.DETALHES_LOJA);
      },
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  image: AssetImage('assets/$produtImg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //Preco, Titulo, Endereco
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Titulo
                Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: Get.height / 30,
                    left: Get.width / 55,
                  ),
                  child: Text(
                    produtNome,
                    style: TextStyle(
                      color: Layout.primary(),
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    left: Get.width / 55,
                  ),
                  child: Text(
                    parceiNome,
                    style: TextStyle(
                      color: Layout.primaryDark(),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 0,
                        left: Get.width / 55,
                      ),
                      child: Text(
                        'Estado: ',
                        style: TextStyle(
                          color: Layout.primaryDark(),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      estado == 0
                          ? 'Seleciondo'
                          : estado == 1
                              ? 'Enviado'
                              : estado == 2
                                  ? 'Aceite'
                                  : 'Processado',
                      style: TextStyle(
                        color: Layout.primary(),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //Icon Reservar
            estado == 0
                ? IconButton(
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
                          Conexao()
                              .dialogSMS('Reserva', 'Actualizado com sucesso!');
                        } else {
                          print("Errado Res: " + res.toString());
                        }
                      } else {
                        Conexao()
                            .dialogSMS('Reserva', 'Preencha todos os campos!');
                      }
                    },
                    icon: const Icon(
                      Icons.double_arrow_rounded,
                    ),
                    color: Layout.primary(),
                    iconSize: 40,
                  )
                : Container(
                    width: Get.width / 3.6,
                  ),
          ],
        ),
      ),
    );
  }
}
