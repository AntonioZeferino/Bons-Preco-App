import 'package:bompreco/app/global/widgets/bt_normal.dart';
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
                    text: 'Add Produto no Sistema',
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
                              // width: Get.width / 3,
                              color: controller.res.value == 0
                                  ? Layout.primaryWhite()
                                  : Layout.primary(),
                              padding: const EdgeInsets.all(8),
                              child: const Center(
                                child: Text(
                                  'Produtos do Sistema',
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
                                  'Produto ligado a Loja',
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
                  SizedBox(
                    height: Get.height / 1.3,
                    width: Get.width,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: const [
                        ListProdutoSistLoja(
                          img: "margherita-pizza-993274_960_720.jpg",
                          titulo: "Arroz Sam",
                          id: 0,
                        ),
                        ListProdutoSistLoja(
                          img: "pop_corn.jpg",
                          titulo: "Massa Tio luca",
                          id: 0,
                        ),
                        ListProdutoSistLoja(
                          img: "margherita-pizza-993274_960_720.jpg",
                          titulo: "Farinha Tio Lucas 10kg",
                          id: 1,
                        ),
                        ListProdutoSistLoja(
                          img: "pop_corn.jpg",
                          titulo: "Farinha Primeira",
                          id: 0,
                        ),
                        ListProdutoSistLoja(
                          img: "cinnamon-roll-4719023_960_720.jpg",
                          titulo: "Gasosa",
                          id: 1,
                        ),
                      ],
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
