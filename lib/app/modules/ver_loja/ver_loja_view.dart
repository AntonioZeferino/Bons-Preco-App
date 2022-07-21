import 'package:bompreco/app/global/widgets/list_loja.dart';
import 'package:bompreco/app/global/widgets/list_loja_preco.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/ver_loja/ver_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VerLojaView extends GetView<VerLojaController> {
  const VerLojaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat formatter = NumberFormat("###,###.00 kz", 'pt_PT');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: ListView(children: [
            //Top
            Column(
              children: [
                const VoltarTop(titulo: "Bons Preços"),
                //Texto loja
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: Get.width / 60,
                        bottom: Get.height / 85,
                      ),
                      child: Text(
                        'Lojas',
                        style: TextStyle(
                          color: Layout.dark(),
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
                    height: Get.height / 1.1,
                    width: Get.width,
                    child: controller.listParceiro.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.listParceiro.length,
                            itemBuilder: (context, index) {
                              return ListLoja(
                                img: "cinnamon-roll-4719023_960_720.jpg",
                                titulo: controller.listParceiro[index].nome
                                    .toString(),
                                endereco: controller
                                    .listParceiro[index].endereco
                                    .toString(),
                                parceiro: controller.listParceiro[index],
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
            ),
          ]),
        ),
      ),
    );
  }
}
