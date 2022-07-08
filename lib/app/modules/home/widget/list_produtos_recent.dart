import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListProdutosRecentes extends StatelessWidget {
  const ListProdutosRecentes({
    Key? key,
    required this.img,
    required this.titulo,
    required this.nLojas,
  }) : super(key: key);

  final String img;
  final String titulo;
  final String nLojas;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    return GestureDetector(
      onTap: () {
        box.write("img", img);
        box.write("titulo", titulo);
        box.write("nLojas", nLojas);
        Get.toNamed(Routes.PRODUTO_LOJA);
      },
      child: Container(
        height: Get.height / 4,
        width: Get.width / 1.5,
        margin: EdgeInsets.only(
          left: Get.width / 80,
          right: Get.width / 80,
          top: Get.height / 80,
          bottom: Get.height / 80,
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
        child: Column(
          children: [
            //IMG
            Container(
              height: Get.height / 3.3,
              width: Get.width,
              decoration: BoxDecoration(
                color: Layout.primary(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/$img'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //Titulo
            Container(
              height: Get.height / 17,
              width: Get.width,
              margin: EdgeInsets.only(
                top: Get.height / 80,
                left: Get.width / 30,
              ),
              child: Text(
                titulo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            //Lojas
            Container(
              child: Row(
                children: [
                  Container(
                    height: 14,
                    width: 14,
                    margin: EdgeInsets.only(
                      bottom: Get.height / 80,
                      left: Get.width / 30,
                    ),
                    decoration: BoxDecoration(
                      color: Layout.primary(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: Get.height / 80,
                      left: Get.width / 30,
                    ),
                    child: Text(
                      "$nLojas Lojas",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    height: Get.height / 30,
                    width: Get.width / 3.3,
                    margin: EdgeInsets.only(
                      bottom: Get.height / 80,
                      left: Get.width / 30,
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
            ),
          ],
        ),
      ),
    );
  }
}
