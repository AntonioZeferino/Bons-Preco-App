import 'dart:convert';

import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListProdutosTop extends StatelessWidget {
  const ListProdutosTop({
    Key? key,
    required this.id,
    required this.img,
    required this.titulo,
    required this.nLojas,
  }) : super(key: key);

  final int? id;
  final String img;
  final String titulo;
  final String nLojas;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    final String rootProduto = Conexao().getImgProduto();
    return GestureDetector(
      onTap: () {
        box.write("ProdutoID", id);
        box.write("img", img);
        box.write("titulo", titulo);
        box.write("nLojas", nLojas);
        Get.toNamed(Routes.PRODUTO_LOJA);
      },
      child: Container(
        height: Get.height / 6,
        width: Get.width / 1.5,
        margin: EdgeInsets.only(
          left: Get.width / 40,
          right: Get.width / 40,
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
          children: [
            //IMG
            Container(
              height: Get.height / 8,
              width: Get.width / 4,
              margin: EdgeInsets.only(
                left: Get.width / 30,
              ),
              decoration: BoxDecoration(
                color: Layout.primaryWhite(),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: CachedNetworkImage(
                imageUrl: rootProduto + img,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Lojas
                Container(
                  margin: EdgeInsets.only(
                    top: Get.height / 70,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 14,
                        width: 14,
                        margin: EdgeInsets.only(
                          top: Get.height / 54,
                          left: Get.width / 42,
                        ),
                        decoration: BoxDecoration(
                          color: Layout.primaryWhite(),
                          border: Border.all(
                            color: Layout.dark(),
                            width: 2,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: Get.height / 60,
                          left: Get.width / 60,
                        ),
                        child: Text(
                          "$nLojas Lojas",
                          style: TextStyle(
                            color: Layout.primary(),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //Titulo
                Container(
                  margin: EdgeInsets.only(
                    left: Get.width / 42,
                  ),
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Bons Preço
                Container(
                  height: Get.height / 30,
                  width: Get.width / 1.7,
                  margin: EdgeInsets.only(
                    top: Get.height / 98,
                    left: Get.width / 45,
                  ),
                  decoration: BoxDecoration(
                    color: Layout.primary(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Bons Preços!",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
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
