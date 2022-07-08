import 'package:bompreco/app/global/widgets/list_loja_preco.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/produto_loja/produto_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
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
        child: Container(
          height: Get.height,
          width: Get.width,
          child: ListView(children: [
            //Top
            Column(
              children: [
                const VoltarTop(titulo: "Bons Preços"),
                //Img
                Container(
                  //color: Layout.danger(),
                  height: Get.height / 2.2,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/${controller.img}'),
                      fit: BoxFit.fill,
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
                Container(
                  height: Get.height / 2,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      ListLojaPreco(
                        img: "margherita-pizza-993274_960_720.jpg",
                        titulo: "Bem Barato",
                        preco: 14000,
                        endereco: "Goa",
                        data: "12/2023",
                        stok: "Tem",
                        st: 0,
                      ),
                      ListLojaPreco(
                        img: "pop_corn.jpg",
                        titulo: "A.Z - Comercial",
                        preco: 15000,
                        endereco: "Kasseque de frente ao kero",
                        data: "02/2024",
                        stok: "Tem",
                        st: 0,
                      ),
                      ListLojaPreco(
                        img: "cinnamon-roll-4719023_960_720.jpg",
                        titulo: "Z.A.K - Serviços,LDA",
                        preco: 15500,
                        endereco: "Praça do 4 de Abril",
                        data: "08/2022",
                        stok: "Terminou",
                        st: 1,
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
