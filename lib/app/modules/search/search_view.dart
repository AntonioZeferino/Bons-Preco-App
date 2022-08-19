import 'package:bompreco/app/global/widgets/list_produtos_top.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/search/search_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ListView(children: [
            Column(
              children: [
                const VoltarTop(titulo: "Bons Preços"),
                //Pesquisas
                Container(
                  margin: EdgeInsets.only(
                    top: Get.height / 99,
                    left: Get.height / 99,
                    right: Get.height / 99,
                  ),
                  decoration: BoxDecoration(
                    color: Layout.primaryWhite(),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    border: Border.all(
                      color: Layout.primaryWhite(),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Layout.dark(.1),
                        spreadRadius: 2.0,
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Campo requerido.';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {
                      controller.listProdutosPesquis(value);
                    },
                    enabled: true,
                    controller: controller.searchCtrl,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Layout.primary(),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.filter_list_rounded,
                          color: Layout.primary(),
                          size: 30,
                        ),
                        onPressed: () {
                          controller
                              .listProdutosPesquis(controller.searchCtrl.text);
                        },
                      ),
                      hintText: 'Pesquisar',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Layout.dark(),
                      ),
                    ),
                  ),
                ),
                //Lista Top
                Obx(
                  () => SizedBox(
                    height: Get.height - 90,
                    width: Get.width,
                    child: controller.listProduto.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.listProduto.length,
                            itemBuilder: (context, index) {
                              return ListProdutosTop(
                                id: controller.listProduto[index].id,
                                img: "cinnamon-roll-4719023_960_720.jpg",
                                titulo: controller.listProduto[index].nome
                                    .toString(),
                                nLojas: controller.listProduto[index].total
                                    .toString(),
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
