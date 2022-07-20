import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/input_normal.dart';
import 'package:bompreco/app/global/widgets/input_password.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/criar_conta/criar_conta_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarContaView extends GetView<CriarContaController> {
  const CriarContaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: controller.formKey,
          child: SizedBox(
            height: Get.height,
            width: Get.width,
            child: ListView(children: [
              Column(
                children: [
                  const VoltarTop(titulo: "Criar Conta"),
                  const SizedBox(
                    height: 45,
                  ),
                  Center(
                    child: Text(
                      'Bem-Vindo',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Layout.dark(),
                      ),
                    ),
                  ),
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

                  //Senha
                  Obx(
                    () => InputPassword(
                      hintText: 'senha',
                      icons: Icons.key,
                      controller: controller.password1Ctrl,
                      enabled: !controller.loading.value,
                      showPassword: !controller.showPassword.value,
                      changeShowPassword: () {
                        controller.showPassword.value =
                            !controller.showPassword.value;
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  Obx(
                    () => InputPassword(
                      hintText: 'senha novamente',
                      icons: Icons.key,
                      controller: controller.password2Ctrl,
                      enabled: !controller.loading.value,
                      showPassword: !controller.showPassword.value,
                      changeShowPassword: () {
                        controller.showPassword.value =
                            !controller.showPassword.value;
                      },
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.loading.value,
                      child: ButtonNormal(
                        text: 'Criar',
                        height: 50,
                        press: () {
                          controller.verificarUser(context);
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
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
