import 'dart:convert';

import 'package:bompreco/app/data/model/parceiro.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListLoja extends StatelessWidget {
  const ListLoja({
    Key? key,
    required this.img,
    required this.titulo,
    required this.endereco,
    required this.parceiro,
  }) : super(key: key);

  final String img;
  final String titulo;
  final String endereco;
  final Parceiro parceiro;
  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    return GestureDetector(
      onTap: () {
        box.write("Parceiro", parceiro);
        Get.toNamed(Routes.DETALHES_LOJA);
      },
      child: Container(
        height: Get.height / 5.4,
        width: Get.width / 1.5,
        margin: EdgeInsets.only(
          left: Get.width / 55,
          right: Get.width / 55,
          top: Get.height / 95,
        ),
        decoration: BoxDecoration(
          color: Layout.primaryWhite(),
          boxShadow: [
            BoxShadow(
              color: Layout.dark(.2),
              spreadRadius: 2.0,
              blurRadius: 6.0,
            ),
          ],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //IMG
            Container(
              height: Get.height / 6.5,
              width: Get.width / 3.8,
              margin: EdgeInsets.only(
                left: Get.width / 40,
              ),
              decoration: BoxDecoration(
                color: Layout.primary(),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/$img'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //Titulo, Endereco, Vencimento, Stok
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Titulo
                Container(
                  margin: EdgeInsets.only(
                    left: Get.width / 55,
                    top: Get.height / 18,
                    bottom: 5,
                  ),
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Endereco loja
                Container(
                  height: Get.height / 28,
                  width: Get.width / 1.9,
                  margin: EdgeInsets.only(
                    top: 2,
                    left: Get.width / 55,
                  ),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    //color: Layout.primary(),
                    border: Border.all(
                      color: Layout.primary(),
                      width: 2,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    endereco,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
