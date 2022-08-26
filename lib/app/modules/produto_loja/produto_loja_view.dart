import 'package:bompreco/app/global/widgets/list_loja_preco.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/produto_loja/produto_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProdutoLojaView extends GetView<ProdutoLojaController> {
  const ProdutoLojaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("###,###.00 kz", 'pt_PT');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ListView(children: [
            //Top
            Column(
              children: [
                const VoltarTop(titulo: "Bons Preços"),
                //Img
                SizedBox(
                  //color: Layout.danger(),
                  height: Get.height / 2.2,
                  width: Get.width,
                  child: CachedNetworkImage(
                    imageUrl:
                        controller.rootProduto + controller.img.toString(),
                    fit: BoxFit.cover,
                    imageBuilder: (BuildContext context, imageProvider) =>
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
                    placeholder: (BuildContext context, url) => Container(
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
                //Titulo produto
                Container(
                  height: Get.height / 17,
                  width: Get.width,
                  margin: EdgeInsets.only(
                    top: Get.height / 80,
                    left: Get.width / 30,
                  ),
                  child: Text(
                    controller.titulo,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Texto loja
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: Get.width / 60,
                      ),
                      child: Text(
                        'Lojas',
                        style: TextStyle(
                          color: Layout.primary(),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                //Lista Top
                Obx(
                  () => SizedBox(
                    height: Get.height / 2,
                    width: Get.width,
                    child: controller.listProduto.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.listProduto.length,
                            itemBuilder: ((context, index) {
                              return ListLojaPreco(
                                produtId:
                                    controller.listProduto[index].produtoId,
                                parceirId:
                                    controller.listProduto[index].parceiroId,
                                userId: controller.user.id,
                                titulo: controller
                                    .listProduto[index].parceiroNome
                                    .toString(),
                                preco: controller.listProduto[index].preco!
                                    .toDouble(),
                                endereco: controller.listProduto[index].endereco
                                    .toString(),
                                data: controller.listProduto[index].dataValidad
                                    .toString(),
                                stok: controller.listProduto[index].estadoStok,
                              );
                            }),
                          )
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
            ),
          ]),
        ),
      ),
    );
  }
}
