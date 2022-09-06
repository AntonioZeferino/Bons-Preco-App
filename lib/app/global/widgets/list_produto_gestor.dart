import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/parcei_produt.dart';
import 'package:bompreco/app/data/repository/parcei.produt.repository.dart';
import 'package:bompreco/app/global/widgets/input_normal.dart';
import 'package:bompreco/app/modules/add_produto_loja/add_produto_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class ListProdutoGestor extends StatelessWidget {
  const ListProdutoGestor({
    Key? key,
    required this.idProduto,
    required this.produtImg,
    required this.produtNome,
  }) : super(key: key);

  final int idProduto;
  final String produtImg;
  final String produtNome;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    final String rootProduto = Conexao().getImgProduto();
    DateFormat formatData = DateFormat("yyyy-MM-dd");
    AddProdutoLojaController controller = AddProdutoLojaController();
    final repository = ParceiProdutRepository();
    ParceiProdut parceiProdut = ParceiProdut();
    TextEditingController precoCtrl = TextEditingController();
    TextEditingController dataCtrl = TextEditingController();
    RxBool valor = false.obs;
    RxBool loading = false.obs;
    RxString token = ''.obs;
    token.value = box.read('accessToken');
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Get.height / 6,
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
              height: Get.height / 8,
              width: Get.width / 4,
              margin: EdgeInsets.only(
                //bottom: Get.height / 80,
                left: Get.width / 30,
              ),
              decoration: BoxDecoration(
                color: Layout.primaryWhite(),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: CachedNetworkImage(
                imageUrl: rootProduto + produtImg,
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
            //Preco, Titulo, Endereco
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Titulo
                Container(
                  margin: EdgeInsets.only(
                    top: Get.height / 15,
                    left: Get.width / 55,
                  ),
                  child: Text(
                    produtNome,
                    style: TextStyle(
                      color: Layout.primary(),
                      fontSize: 17,
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
