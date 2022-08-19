import 'package:bompreco/app/global/widgets/list_produto_loja.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/detalhes_loja/detalhes_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetalhesLojaView extends GetView<DetalhesLojaController> {
  const DetalhesLojaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //NumberFormat formatter = NumberFormat("###,###.00 kz", 'pt_PT');

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
                margin: const EdgeInsets.all(8),
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
                            image: const DecorationImage(
                              image: AssetImage(
                                  'assets/christmas-cookies-1886760_960_720.webp'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Titulo
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
                      "Aberto das " + controller.parceiro.horario.toString(),
                      style: TextStyle(
                        color: Layout.dark(),
                        fontSize: 20,
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
                            fontSize: 18,
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
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //Texto Loja, Lista
              Column(
                children: [
                  //Texto loja
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          right: Get.width / 60,
                          bottom: Get.height / 90,
                        ),
                        child: Text(
                          'Produtos',
                          style: TextStyle(
                            color: Layout.dark(),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
                                return ListProdutoLoja(
                                  userId: controller.user.id,
                                  produtId:
                                      controller.listProduto[index].produtoId,
                                  parceirId:
                                      controller.listProduto[index].parceiroId,
                                  img: "margherita-pizza-993274_960_720.jpg",
                                  titulo: controller
                                      .listProduto[index].produtoNome
                                      .toString(),
                                  preco: controller.listProduto[index].preco!
                                      .toDouble(),
                                  data: controller
                                      .listProduto[index].dataValidad!,
                                  stok: controller
                                      .listProduto[index].estadoStok!
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
