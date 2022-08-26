import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/list_produto_reserva.dart';
import 'package:bompreco/app/global/widgets/list_produto_sistema.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/minhas_reservas/minhas_reservas_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MinhasReservasView extends GetView<MinhasReservasController> {
  const MinhasReservasView({Key? key}) : super(key: key);

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
              Container(
                margin: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Reservas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Layout.primary(),
                    ),
                  ),
                ),
              ),
              //Texto produtos, Lista
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
                              // width: Get.width / 3,
                              color: controller.res.value == 0
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Text(
                                  'Selecionados',
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
                                  'Enviados',
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
                      ],
                    ),
                  ),
                  //Lista
                  Obx(
                    () => controller.res == 0
                        ? SizedBox(
                            height: Get.height / 1.3,
                            width: Get.width,
                            child: controller.listSelecionado.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        controller.listSelecionado.length,
                                    itemBuilder: (context, index) {
                                      return ListProdutoReserva(
                                        idReserva: controller
                                            .listSelecionado[index].idReserva!,
                                        idParceiro: controller
                                            .listSelecionado[index].idParceiro!,
                                        idProduto: controller
                                            .listSelecionado[index].idProduto!,
                                        idUser: controller
                                            .listSelecionado[index].idUser!,
                                        estado: controller
                                            .listSelecionado[index].estado!,
                                        produtImg: controller
                                            .listSelecionado[index].produtImg
                                            .toString(),
                                        produtNome: controller
                                            .listSelecionado[index].produtNome
                                            .toString(),
                                        parceiNome: controller
                                            .listSelecionado[index].parceiNome
                                            .toString(),
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
                                child: controller.listEnviado.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            controller.listEnviado.length,
                                        itemBuilder: (context, index) {
                                          return ListProdutoReserva(
                                            idReserva: controller
                                                .listEnviado[index].idReserva!,
                                            idParceiro: controller
                                                .listEnviado[index].idParceiro!,
                                            idProduto: controller
                                                .listEnviado[index].idProduto!,
                                            idUser: controller
                                                .listEnviado[index].idUser!,
                                            estado: controller
                                                .listEnviado[index].estado!,
                                            produtImg: controller
                                                .listEnviado[index].produtImg
                                                .toString(),
                                            produtNome: controller
                                                .listEnviado[index].produtNome
                                                .toString(),
                                            parceiNome: controller
                                                .listEnviado[index].parceiNome
                                                .toString(),
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
                            : controller.res == 2
                                ? SizedBox(
                                    height: Get.height / 1.3,
                                    width: Get.width,
                                    child: controller.listAceite.isNotEmpty
                                        ? ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                controller.listAceite.length,
                                            itemBuilder: (context, index) {
                                              return ListProdutoReserva(
                                                idReserva: controller
                                                    .listAceite[index]
                                                    .idReserva!,
                                                idParceiro: controller
                                                    .listAceite[index]
                                                    .idParceiro!,
                                                idProduto: controller
                                                    .listAceite[index]
                                                    .idProduto!,
                                                idUser: controller
                                                    .listAceite[index].idUser!,
                                                estado: controller
                                                    .listAceite[index].estado!,
                                                produtImg: controller
                                                    .listAceite[index].produtImg
                                                    .toString(),
                                                produtNome: controller
                                                    .listAceite[index]
                                                    .produtNome
                                                    .toString(),
                                                parceiNome: controller
                                                    .listAceite[index]
                                                    .parceiNome
                                                    .toString(),
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
