import 'dart:io';
import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/input_normal.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/registra_produto/registra_produto_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistraProdutoView extends GetView<RegistraProdutoController> {
  const RegistraProdutoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formkey,
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(children: [
              Column(
                children: [
                  const VoltarTop(titulo: "Criar Produto"),
                  const SizedBox(
                    height: 15,
                  ),
                  //Nome
                  Obx(
                    () => InputNormal(
                      hintText: 'Nome',
                      icons: Icons.person,
                      controller: controller.nomeCtrl,
                      enabled: !controller.loading.value,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: [
                      const Text(
                        'Selecione a imagem do produto!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //foto 1
                      GestureDetector(
                        onTap: () {
                          controller.bottomCamera(true);
                        },
                        child: Obx(
                          () => controller.verImg1.value == 1
                              ? CachedNetworkImage(
                                  imageUrl: controller.root +
                                      controller.produto.img.toString(),
                                  fit: BoxFit.cover,
                                  imageBuilder:
                                      (BuildContext context, imageProvider) =>
                                          Container(
                                    height: Get.height / 4,
                                    width: Get.width / 1.3,
                                    decoration: BoxDecoration(
                                      color: Layout.primary(),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  placeholder: (BuildContext context, url) =>
                                      Container(
                                    height: Get.height / 4,
                                    width: Get.width / 1.3,
                                    decoration: BoxDecoration(
                                      color: Layout.primary(),
                                      borderRadius: BorderRadius.circular(10),
                                      image: const DecorationImage(
                                        image: AssetImage('assets/logo.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: Layout.primaryWhite(),
                                      ),
                                    ),
                                  ),
                                )
                              : controller.isPicked1.value
                                  ? Container(
                                      height: Get.height / 4,
                                      width: Get.width / 1.3,
                                      decoration: BoxDecoration(
                                        color: Layout.primary(),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(controller.image1.value.path),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Container(
                                      height: Get.height / 4,
                                      width: Get.width / 1.3,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage('assets/logo.png'),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.loading.value,
                      child: ButtonNormal(
                        text: 'Criar',
                        height: 50,
                        press: () {
                          controller.setPedido();
                        },
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.loading.value,
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
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
