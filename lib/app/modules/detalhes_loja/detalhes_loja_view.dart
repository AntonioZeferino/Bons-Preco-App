import 'package:bompreco/app/global/widgets/list_loja_preco.dart';
import 'package:bompreco/app/global/widgets/list_produto_loja.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/detalhes_loja/detalhes_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetalhesLojaView extends GetView<DetalhesLojaController> {
  const DetalhesLojaView({Key? key}) : super(key: key);

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
                            Container(
                              margin: EdgeInsets.only(
                                top: Get.height / 100,
                                left: Get.width / 30,
                              ),
                              child: Text(
                                "Bem Barato",
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
                                "948779728",
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
                                "bembarato@gmail.com",
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
                                    "Kasseque enfrente ao Kero",
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
                      "Aberto das 08h as 17h",
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
                          Icons.check_circle,
                          color: Layout.success(),
                          //Icons.cancel,
                          //color: Layout.danger(),

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
                  Container(
                    height: Get.height / 1.3,
                    width: Get.width,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: const [
                        ListProdutoLoja(
                          img: "margherita-pizza-993274_960_720.jpg",
                          titulo: "Arroz Sam",
                          preco: 14000,
                          data: "04/2023",
                          stok: "Tem",
                          st: 0,
                        ),
                        ListProdutoLoja(
                          img: "pop_corn.jpg",
                          titulo: "Massa Tio luca",
                          preco: 15000,
                          data: "09/2023",
                          stok: "Tem",
                          st: 0,
                        ),
                        ListProdutoLoja(
                          img: "margherita-pizza-993274_960_720.jpg",
                          titulo: "Farinha Tio Lucas 10kg",
                          preco: 14000,
                          data: "05/2023",
                          stok: "Terminou",
                          st: 1,
                        ),
                        ListProdutoLoja(
                          img: "pop_corn.jpg",
                          titulo: "Farinha Primeira",
                          preco: 15000,
                          data: "02/2023",
                          stok: "Tem",
                          st: 0,
                        ),
                        ListProdutoLoja(
                          img: "cinnamon-roll-4719023_960_720.jpg",
                          titulo: "Gasosa",
                          preco: 8500,
                          data: "12/2023",
                          stok: "Terminou",
                          st: 1,
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
