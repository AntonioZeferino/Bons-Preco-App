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

class ListProdutoSistLoja extends StatelessWidget {
  const ListProdutoSistLoja({
    Key? key,
    required this.idProduto,
    required this.idParceiro,
    required this.produtImg,
    required this.produtNome,
  }) : super(key: key);

  final int idProduto;
  final int idParceiro;
  final String produtImg;
  final String produtNome;

  @override
  Widget build(BuildContext context) {
    final box = GetStorage('BonsPreco');
    final String rootProduto = Conexao().getImgProduto();
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
      onTap: () {
        Get.defaultDialog(
          title: "Adicionar Produto!",
          titleStyle: TextStyle(
            fontSize: 22,
            color: Layout.dark(),
            fontWeight: FontWeight.bold,
          ),
          content: Container(
              //padding: EdgeInsets.all(Get.width / 32),
              child: Column(
            children: [
              Center(
                child: Text(
                  produtNome,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Layout.primary(),
                  ),
                ),
              ),
              //Preco
              Obx(
                () => InputNormal(
                  hintText: 'Preço',
                  icons: Icons.monetization_on,
                  controller: precoCtrl,
                  enabled: !loading.value,
                  onChanged: (value) {},
                ),
              ),
              //Data
              Obx(
                () => InputNormal(
                  hintText: 'Data',
                  icons: Icons.date_range_rounded,
                  controller: dataCtrl,
                  enabled: !loading.value,
                  onChanged: (value) {},
                ),
              ),

              Container(
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(
                      () => Checkbox(
                        checkColor: Layout.dark(),
                        activeColor: Layout.primary(),
                        value: valor.value,
                        onChanged: (value) {
                          valor.value = value!;
                        },
                      ),
                    ),
                    Text(
                      'Stock',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Layout.dark(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          textConfirm: 'Guardar',
          confirmTextColor: Layout.primaryWhite(),
          onConfirm: () async {
            if (precoCtrl.text != '' && dataCtrl.text != '' && valor.value) {
              parceiProdut.idParceiro = idParceiro;
              parceiProdut.idProduto = idProduto;
              parceiProdut.preco = int.parse(precoCtrl.text);
              parceiProdut.dataValidad = dataCtrl.text;
              parceiProdut.estadoStok = valor.value ? 1 : 0;
              var res = await repository.parceiProdutInsert(
                  parceiProdut, token.value);
              if (res) {
                precoCtrl.text = "";
                dataCtrl.text = "";
                Conexao().dialogSMS('Produto', 'Enviado com sucesso!');
                controller.pegarProdutSistema();
                loading.value = false;
              } else {
                loading.value = false;
                print("Erro Res: " + res.toString());
              }
            }
          },
          textCancel: 'Cancelar',
          onCancel: () {},
        );
      },
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                color: Layout.primary(),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Titulo
                Container(
                  margin: EdgeInsets.only(
                    bottom: 0,
                    top: Get.height / 30,
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
            //Icon Reservar
            IconButton(
              onPressed: () async {},
              icon: const Icon(
                Icons.double_arrow_rounded,
              ),
              color: Layout.primary(),
              iconSize: 40,
            )
          ],
        ),
      ),
    );
  }
}
