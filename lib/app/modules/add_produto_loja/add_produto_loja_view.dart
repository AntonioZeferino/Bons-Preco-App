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
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: Get.height / 18,
                            // width: Get.width / 3,

                            padding: const EdgeInsets.all(8),
                            child: Center(
                              child: Text(
                                'Produtos do Sistema',
                                style: TextStyle(
                                  color: Layout.primaryWhite(),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
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
                    () => SizedBox(
                      height: Get.height / 1.3,
                      width: Get.width,
                      child: controller.listProduto.isNotEmpty
                          ? ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: controller.listProduto.length,
                              itemBuilder: (context, index) {
                                return ListProdutoSistLoja(
                                  idParceiro: controller.parceiro.id!,
                                  idProduto: controller.listProduto[index].id!,
                                  produtImg:
                                      "margherita-pizza-993274_960_720.jpg",
                                  produtNome: controller.listProduto[index].nome
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
