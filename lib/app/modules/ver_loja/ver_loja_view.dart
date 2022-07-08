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
                Container(
                  height: Get.height / 1.1,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      ListLoja(
                        img: "margherita-pizza-993274_960_720.jpg",
                        titulo: "Bem Barato",
                        endereco: "Goa",
                      ),
                      ListLoja(
                        img: "pop_corn.jpg",
                        titulo: "A.Z - Comercial",
                        endereco: "Kasseque de frente ao kero",
                      ),
                      ListLoja(
                        img: "margherita-pizza-993274_960_720.jpg",
                        titulo: "Bem Barato",
                        endereco: "Goa",
                      ),
                      ListLoja(
                        img: "pop_corn.jpg",
                        titulo: "A.Z - Comercial",
                        endereco: "Kasseque de frente ao kero",
                      ),
                      ListLoja(
                        img: "cinnamon-roll-4719023_960_720.jpg",
                        titulo: "Z.A.K - Serviços,LDA",
                        endereco: "Praça do 4 de Abril",
                      ),
                      ListLoja(
                        img: "pop_corn.jpg",
                        titulo: "A.Z - Comercial",
                        endereco: "Kasseque de frente ao kero",
                      ),
                      ListLoja(
                        img: "cinnamon-roll-4719023_960_720.jpg",
                        titulo: "Z.A.K - Serviços,LDA",
                        endereco: "Praça do 4 de Abril",
                      ),
                    ],
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
