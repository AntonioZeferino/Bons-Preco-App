import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/list_produto_loja.dart';
import 'package:bompreco/app/global/widgets/list_produto_loja_reserva.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/minha_loja/minha_loja_controller.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MinhaLojaView extends GetView<MinhaLojaController> {
  const MinhaLojaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("###,###.00 kz", 'pt_PT');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ListView(
            children: [
              const VoltarTop(titulo: "Bons Preços"),
              //Texto loja
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      margin: EdgeInsets.only(
                        right: Get.width / 60,
                        //bottom: Get.height / 90,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Layout.primaryDark(),
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Editar Loja',
                        style: TextStyle(
                          color: Layout.dark(),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //Top
              Container(
                margin: const EdgeInsets.only(
                  left: 8,
                  right: 8,
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        //Img
                        Container(
                          //color: Layout.danger(),
                          height: Get.height / 6,
                          width: Get.width / 3.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: controller.rootParceiro +
                                controller.parceiro.img.toString(),
                            fit: BoxFit.cover,
                            imageBuilder:
                                (BuildContext context, imageProvider) =>
                                    Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  topLeft: Radius.circular(6),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (BuildContext context, url) =>
                                Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  topLeft: Radius.circular(6),
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/icone.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Layout.primaryWhite(),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: Get.height / 100,
                                left: Get.width / 30,
                              ),
                              child: Text(
                                controller.parceiro.nome.toString(),
                                style: TextStyle(
                                  color: Layout.dark(),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //Contacto
                            Container(
                              margin: EdgeInsets.only(
                                left: Get.width / 30,
                              ),
                              child: Text(
                                controller.parceiro.contacto.toString(),
                                style: TextStyle(
                                  color: Layout.primary(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            //Email
                            Container(
                              margin: EdgeInsets.only(
                                left: Get.width / 30,
                              ),
                              child: Text(
                                controller.parceiro.email.toString(),
                                style: TextStyle(
                                  color: Layout.primary(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            //Endereco
                            Column(
                              children: [
                                Container(
                                  width: Get.width / 1.6,
                                  margin: EdgeInsets.only(
                                    left: Get.width / 30,
                                  ),
                                  child: Text(
                                    controller.parceiro.endereco.toString(),
                                    style: TextStyle(
                                      color: Layout.primary(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Horarios e Entregas
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: Get.width / 30,
                    ),
                    child: Text(
                      controller.parceiro.horario.toString(),
                      style: TextStyle(
                        color: Layout.dark(),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          left: Get.width / 30,
                        ),
                        child: Text(
                          "Entregas:",
                          style: TextStyle(
                            color: Layout.dark(),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 1,
                        ),
                        child: Icon(
                          controller.parceiro.entregas == 1
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: controller.parceiro.entregas == 1
                              ? Layout.success()
                              : Layout.danger(),
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Get.width,
                      // width: Get.width / 1.4,
                      margin: EdgeInsets.only(
                        bottom: Get.height / 70,
                      ),
                      child: ButtonNormal(
                        color: Layout.primary(),
                        height: 52,
                        text: 'Registrar Produtos',
                        press: () {
                          Get.toNamed(Routes.ADD_PRODUTO_LOJA);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              //Texto Loja, Lista
              Column(
                children: [
                  //Itens Reservas
                  Container(
                    height: Get.height / 18,
                    width: Get.width,
                    color: Layout.primary(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.res.value = 0;
                            },
                            child: Container(
                              height: Get.height / 18,
                              color: controller.res.value == 0
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Text(
                                  'Reservas',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.res.value = 1;
                            },
                            child: Container(
                              height: Get.height / 18,
                              //width: Get.width / 3,
                              padding: const EdgeInsets.all(8),
                              color: controller.res.value == 1
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              child: const Center(
                                child: Text(
                                  'Aceites',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.res.value = 2;
                            },
                            child: Container(
                              height: Get.height / 18,
                              //width: Get.width / 3,
                              padding: const EdgeInsets.all(8),
                              color: controller.res.value == 2
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              child: const Center(
                                child: Text(
                                  'Processada',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.res.value = 3;
                            },
                            child: Container(
                              height: Get.height / 18,
                              //width: Get.width / 3,
                              color: controller.res.value == 3
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Text(
                                  'Terminados',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Lista
                  Obx(
                    () => controller.res == 0
                        ? SizedBox(
                            height: Get.height / 1.3,
                            width: Get.width,
                            child: controller.listReserva.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.listReserva.length,
                                    itemBuilder: (context, index) {
                                      return ListProdutoLojaReserva(
                                        idReserva: controller
                                            .listReserva[index].idReservas,
                                        userId: controller.user.id,
                                        userNome: controller
                                            .listReserva[index].userNome,
                                        parceirId: controller
                                            .listReserva[index].idParceiro,
                                        produtId: controller
                                            .listReserva[index].idProduto,
                                        img: controller
                                            .listReserva[index].prodImg
                                            .toString(),
                                        titulo: controller
                                            .listReserva[index].prodNome
                                            .toString(),
                                        preco: controller
                                            .listReserva[index].preco!
                                            .toDouble(),
                                        data: controller
                                            .listReserva[index].dataValidad!,
                                        stok: controller
                                            .listReserva[index].estadoStok!
                                            .toInt(),
                                        estado: controller
                                            .listReserva[index].estado!
                                            .toInt(),
                                      );
                                    })
                                : Center(
                                    child: Text(
                                      'Sem Reservas',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Layout.primary()),
                                    ),
                                  ),
                          )
                        : controller.res == 1
                            ? SizedBox(
                                height: Get.height / 1.3,
                                width: Get.width,
                                child: controller.listAceites.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            controller.listAceites.length,
                                        itemBuilder: (context, index) {
                                          return ListProdutoLojaReserva(
                                            idReserva: controller
                                                .listAceites[index].idReservas,
                                            userId: controller.user.id,
                                            userNome: controller
                                                .listAceites[index].userNome,
                                            parceirId: controller
                                                .listAceites[index].idParceiro,
                                            produtId: controller
                                                .listAceites[index].idProduto,
                                            img: controller
                                                .listAceites[index].prodImg
                                                .toString(),
                                            titulo: controller
                                                .listAceites[index].prodNome
                                                .toString(),
                                            preco: controller
                                                .listAceites[index].preco!
                                                .toDouble(),
                                            data: controller.listAceites[index]
                                                .dataValidad!,
                                            stok: controller
                                                .listAceites[index].estadoStok!
                                                .toInt(),
                                            estado: controller
                                                .listAceites[index].estado!
                                                .toInt(),
                                          );
                                        })
                                    : Center(
                                        child: Text(
                                          'Sem Reservas Aceites',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Layout.primary()),
                                        ),
                                      ),
                              )
                            : controller.res == 2
                                ? SizedBox(
                                    height: Get.height / 1.3,
                                    width: Get.width,
                                    child: controller.listProcessada.isNotEmpty
                                        ? ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: controller
                                                .listProcessada.length,
                                            itemBuilder: (context, index) {
                                              return ListProdutoLojaReserva(
                                                idReserva: controller
                                                    .listProcessada[index]
                                                    .idReservas,
                                                userId: controller.user.id,
                                                userNome: controller
                                                    .listProcessada[index]
                                                    .userNome,
                                                parceirId: controller
                                                    .listProcessada[index]
                                                    .idParceiro,
                                                produtId: controller
                                                    .listProcessada[index]
                                                    .idProduto,
                                                img: controller
                                                    .listProcessada[index]
                                                    .prodImg
                                                    .toString(),
                                                titulo: controller
                                                    .listProcessada[index]
                                                    .prodNome
                                                    .toString(),
                                                preco: controller
                                                    .listProcessada[index]
                                                    .preco!
                                                    .toDouble(),
                                                data: controller
                                                    .listProcessada[index]
                                                    .dataValidad!,
                                                stok: controller
                                                    .listProcessada[index]
                                                    .estadoStok!
                                                    .toInt(),
                                                estado: controller
                                                    .listProcessada[index]
                                                    .estado!
                                                    .toInt(),
                                              );
                                            })
                                        : Center(
                                            child: Text(
                                              'Sem Reservas Processadas',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Layout.primary()),
                                            ),
                                          ),
                                  )
                                : controller.res == 3
                                    ? SizedBox(
                                        height: Get.height / 1.3,
                                        width: Get.width,
                                        child: controller
                                                .listTerminados.isNotEmpty
                                            ? ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: controller
                                                    .listTerminados.length,
                                                itemBuilder: (context, index) {
                                                  return ListProdutoLojaReserva(
                                                    idReserva: controller
                                                        .listTerminados[index]
                                                        .idReservas,
                                                    userId: controller.user.id,
                                                    userNome: controller
                                                        .listTerminados[index]
                                                        .userNome,
                                                    parceirId: controller
                                                        .listTerminados[index]
                                                        .idParceiro,
                                                    produtId: controller
                                                        .listTerminados[index]
                                                        .idProduto,
                                                    img: controller
                                                        .listTerminados[index]
                                                        .prodImg
                                                        .toString(),
                                                    titulo: controller
                                                        .listTerminados[index]
                                                        .prodNome
                                                        .toString(),
                                                    preco: controller
                                                        .listTerminados[index]
                                                        .preco!
                                                        .toDouble(),
                                                    data: controller
                                                        .listTerminados[index]
                                                        .dataValidad!,
                                                    stok: controller
                                                        .listTerminados[index]
                                                        .estadoStok!
                                                        .toInt(),
                                                    estado: controller
                                                        .listTerminados[index]
                                                        .estado!
                                                        .toInt(),
                                                  );
                                                })
                                            : Center(
                                                child: Text(
                                                  'Sem Reservas Terminados',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Layout.primary()),
                                                ),
                                              ),
                                      )
                                    : const Text('Nada!'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
