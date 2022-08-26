import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/list_produto_loja.dart';
import 'package:bompreco/app/global/widgets/list_produto_minha_loja.dart';
import 'package:bompreco/app/global/widgets/list_produto_sistema.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/add_produto_loja/add_produto_loja_controller.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddProdutoLojaView extends GetView<AddProdutoLojaController> {
  const AddProdutoLojaView({Key? key}) : super(key: key);

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
                margin: EdgeInsets.only(
                  left: Get.width / 14,
                  right: Get.width / 14,
                  bottom: Get.height / 42,
                ),
                width: Get.width / 5,
                child: Column(children: [
                  ButtonNormal(
                    color: Layout.primary(),
                    text: 'Add Produto no Sist.',
                    height: 45,
                    press: () {
                      Get.toNamed(Routes.REGISTRA_PRODUTO);
                    },
                  ),
                ]),
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
                              width: Get.width / 3,
                              color: controller.res.value == 0
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Text(
                                  'Sistema',
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
                              height: Get.height / 14,
                              width: Get.width / 3,
                              color: controller.res.value == 1
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Text(
                                  'Loja',
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
                    () => controller.res.value == 0
                        ? SizedBox(
                            height: Get.height / 1.3,
                            width: Get.width,
                            child: controller.listProduto.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.listProduto.length,
                                    itemBuilder: (context, index) {
                                      return ListProdutoSistLoja(
                                        idParceiro: controller.parceiro.id!,
                                        idProduto:
                                            controller.listProduto[index].id!,
                                        produtImg: controller
                                            .listProduto[index].img
                                            .toString(),
                                        produtNome: controller
                                            .listProduto[index].nome
                                            .toString(),
                                      );
                                    })
                                : Center(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SizedBox.expand(
                                        child: TextButton(
                                          child: CircularProgressIndicator(
                                            color: Layout.primary(),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                          )
                        : SizedBox(
                            height: Get.height / 1.3,
                            width: Get.width,
                            child: controller.listProdLoja.isNotEmpty
                                ? ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: controller.listProdLoja.length,
                                    itemBuilder: (context, index) {
                                      return ListProdutoMinhaLoja(
                                        userId: controller.user.id,
                                        parceirId: controller
                                            .listProdLoja[index].idParceiro,
                                        produtId: controller
                                            .listProdLoja[index].idProduto,
                                        img: controller
                                            .listProdLoja[index].prodImg
                                            .toString(),
                                        titulo: controller
                                            .listProdLoja[index].prodNome
                                            .toString(),
                                        preco: controller
                                            .listProdLoja[index].preco!
                                            .toDouble(),
                                        data: controller
                                            .listProdLoja[index].dataValidad!,
                                        stok: controller
                                            .listProdLoja[index].estadoStok!
                                            .toInt(),
                                      );
                                    })
                                : Center(
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: SizedBox.expand(
                                        child: TextButton(
                                          child: CircularProgressIndicator(
                                            color: Layout.primary(),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
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
