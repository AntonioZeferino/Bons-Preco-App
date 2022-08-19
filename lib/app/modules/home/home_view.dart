import 'package:bompreco/app/global/widgets/list_produtos_top.dart';
import 'package:bompreco/app/global/widgets/menu_top.dart';
import 'package:bompreco/app/global/widgets/navigationDrawerWidget.dart';
import 'package:bompreco/app/modules/home/home_controller.dart';
import 'package:bompreco/app/modules/home/widget/list_produtos_recent.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawerWidget(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: Get.height,
          width: Get.width,
          child: ListView(children: [
            //Top
            Column(
              children: [
                const MenuTop(
                  titulo: "Bons Preços",
                ),
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
                      controller.pegarPesquisar(value);
                    },
                    enabled: true,
                    //controller: controller.searchCtrl,
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
                          controller.pegarPesquisar(
                              controller.searchCtrl.text.toString());
                        },
                      ),
                      hintText: 'Pesquisar aqui!',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Layout.dark(),
                      ),
                    ),
                  ),
                ),
                //Texto Produtos
                Container(
                  height: Get.height / 17,
                  width: Get.width,
                  margin: EdgeInsets.only(
                    top: Get.height / 80,
                    left: Get.width / 30,
                  ),
                  child: const Text(
                    'Produtos Recentes',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Lista
                Obx(
                  () => SizedBox(
                    height: Get.height / 2.2,
                    width: Get.width,
                    child: controller.listProduto.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.listProdutoRecentes.length,
                            itemBuilder: (context, index) {
                              return ListProdutosRecentes(
                                id: controller.listProduto[index].id,
                                img: "margherita-pizza-993274_960_720.jpg",
                                titulo: controller
                                    .listProdutoRecentes[index].nome
                                    .toString(),
                                nLojas: controller
                                    .listProdutoRecentes[index].total
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
                //Texto Produtos Top
                Container(
                  height: Get.height / 17,
                  width: Get.width,
                  margin: EdgeInsets.only(
                    top: Get.height / 80,
                    left: Get.width / 30,
                  ),
                  child: const Text(
                    'Top produtos',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Lista Top
                Obx(
                  () => SizedBox(
                    height: Get.height / 2,
                    width: Get.width,
                    child: controller.listProduto.isNotEmpty
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: controller.listProdutoTop.length,
                            itemBuilder: (context, index) {
                              return ListProdutosTop(
                                id: controller.listProduto[index].id,
                                img: "pop_corn.jpg",
                                titulo: controller.listProdutoTop[index].nome
                                    .toString(),
                                nLojas: controller.listProdutoTop[index].total
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
