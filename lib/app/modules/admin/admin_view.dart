import 'package:bompreco/app/global/widgets/list_loja.dart';
import 'package:bompreco/app/global/widgets/list_produto_gestor.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/admin/admin_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AdminView extends GetView<AdminController> {
  const AdminView({Key? key}) : super(key: key);

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
              //Top
              Container(
                width: Get.width,
                margin: const EdgeInsets.only(
                  bottom: 8,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                top: Get.height / 100,
                                left: Get.width / 30,
                              ),
                              child: Text(
                                controller.user.nome.toString(),
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
                                controller.user.contacto.toString(),
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
                                controller.user.email.toString(),
                                style: TextStyle(
                                  color: Layout.primary(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            //Linha
                            Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Layout.dark(),
                                width: 2,
                                style: BorderStyle.solid,
                              )),
                            ),
                            //Totais
                            Container(
                              margin: const EdgeInsets.only(
                                left: 14,
                              ),
                              child: Row(children: [
                                Text(
                                  "Totais",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Layout.dark(),
                                  ),
                                ),
                              ]),
                            ),
                            //Totais Produto
                            Container(
                              margin: const EdgeInsets.only(
                                left: 14,
                              ),
                              child: Row(children: [
                                Obx(
                                  () => Text(
                                    "Lojas: ${controller.listParceiro.length}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Layout.dark(),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Obx(
                                  () => Text(
                                    "Produtos: ${controller.listProduto.length}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Layout.dark(),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //Texto Loja, Lista
              Column(
                children: [
                  //Itens
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
                                  'Lojas',
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
                                  'Produtos',
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
                            child: controller.listParceiro.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.listParceiro.length,
                                    itemBuilder: (context, index) {
                                      return ListLoja(
                                        img: controller.listParceiro[index].img
                                            .toString(),
                                        titulo: controller
                                            .listParceiro[index].nome
                                            .toString(),
                                        endereco: controller
                                            .listParceiro[index].endereco
                                            .toString(),
                                        parceiro:
                                            controller.listParceiro[index],
                                      );
                                    })
                                : Center(
                                    child: Text(
                                      'Sem Parceiros Registrado',
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
                                child: controller.listProduto.isNotEmpty
                                    ? ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            controller.listProduto.length,
                                        itemBuilder: (context, index) {
                                          return ListProdutoGestor(
                                            idProduto: controller
                                                .listProduto[index].id!,
                                            produtImg: controller
                                                .listProduto[index].img
                                                .toString(),
                                            produtNome: controller
                                                .listProduto[index].nome
                                                .toString(),
                                          );
                                        })
                                    : Center(
                                        child: Text(
                                          'Sem Produtos no Sistema',
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
