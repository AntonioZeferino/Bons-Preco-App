import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/input_normal.dart';
import 'package:bompreco/app/global/widgets/input_password.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/criar_loja/criar_loja_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarLojaView extends GetView<CriarLojaController> {
  const CriarLojaView({Key? key}) : super(key: key);

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
                  const VoltarTop(titulo: "Criar Loja"),
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
                  //Contacto
                  Obx(
                    () => InputNormal(
                      hintText: 'Contacto',
                      icons: Icons.phone_in_talk,
                      controller: controller.contactoCtrl,
                      enabled: !controller.loading.value,
                      onChanged: (value) {},
                    ),
                  ),
                  //E-mail
                  Obx(
                    () => InputNormal(
                      hintText: 'E-mail',
                      icons: Icons.email,
                      controller: controller.emailCtrl,
                      enabled: !controller.loading.value,
                      onChanged: (value) {},
                    ),
                  ),
                  //Horário
                  Obx(
                    () => InputNormal(
                      hintText: 'Horário',
                      icons: Icons.access_time_filled_outlined,
                      controller: controller.horarioCtrl,
                      enabled: !controller.loading.value,
                      maxLines: 3,
                      onChanged: (value) {},
                    ),
                  ),
                  //Endereço
                  Obx(
                    () => InputNormal(
                      hintText: 'Endereço',
                      icons: Icons.add_location_alt_sharp,
                      controller: controller.enderecoCtrl,
                      enabled: !controller.loading.value,
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
                            value: controller.valor.value,
                            onChanged: (value) {
                              controller.valor.value = value!;
                            },
                          ),
                        ),
                        Text(
                          'Entregas',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Layout.dark(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      const Text(
                        'Selecione o logo da loja!',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: Get.height / 4,
                        width: Get.width / 1.3,
                        decoration: BoxDecoration(
                          color: Layout.primary(),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Clique a qui',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Layout.primaryWhite(),
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
                        press: () {},
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
