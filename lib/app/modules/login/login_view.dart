import 'package:bompreco/app/global/widgets/bt_normal.dart';
import 'package:bompreco/app/global/widgets/input_normal.dart';
import 'package:bompreco/app/global/widgets/input_password.dart';
import 'package:bompreco/app/global/widgets/voltar_top.dart';
import 'package:bompreco/app/modules/login/login_controller.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                  const VoltarTop(titulo: "Login"),
                  //IMG
                  Container(
                    height: Get.height / 6,
                    width: Get.width / 1.2,
                    margin: EdgeInsets.only(
                      top: Get.height / 10,
                      bottom: Get.height / 14,
                      left: Get.width / 10,
                      right: Get.width / 10,
                    ),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.fill,
                    )),
                  ),
                  //User
                  Obx(
                    () => InputNormal(
                      hintText: 'Usuário',
                      icons: Icons.person,
                      controller: controller.userCtrl,
                      enabled: !controller.loading.value,
                      onChanged: (value) {},
                    ),
                  ),
                  //PassWord
                  Obx(
                    () => InputPassword(
                      hintText: 'Senha',
                      icons: Icons.key,
                      controller: controller.passeCtrl,
                      showPassword: !controller.showPassword.value,
                      changeShowPassword: () {
                        controller.showPassword.value =
                            !controller.showPassword.value;
                      },
                      enabled: !controller.loading.value,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Visibility(
                      visible: !controller.loading.value,
                      child: ButtonNormal(
                        text: 'Entrar',
                        height: 50,
                        press: () {
                          controller.verificaLogin(context);
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 80,
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
