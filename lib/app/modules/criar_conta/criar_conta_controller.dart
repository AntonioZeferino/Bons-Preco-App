import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/token.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/user.repository.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CriarContaController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final box = GetStorage('BonsPreco');
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController contactoCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController password1Ctrl = TextEditingController();
  TextEditingController password2Ctrl = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  RxBool valor = false.obs;

  User user = User();
  final repository = AuthUserRepository();

  void verificarUser(BuildContext context) async {
    if (Conexao().net.value) {
      if (formKey.currentState!.validate()) {
        loading.value = true;

        if (password1Ctrl.text == password2Ctrl.text) {
          user.nome = nomeCtrl.text;
          user.email = emailCtrl.text;
          user.contacto = contactoCtrl.text;
          user.password = password1Ctrl.text;

          Token token = await repository.register(user).catchError((onError) {
            loading.value = false;
          });
          loading.value = false;
          if (token.accessToken != null) {
            User? user = await repository.userMe(token.accessToken.toString());

            box.write('accessToken', token.accessToken);
            box.write('tokenType', token.tokenType);
            if (user != null) {
              box.write('user', user.toJson());
            }

            Get.offNamed(Routes.HOME);
          }
        } else {
          loading.value = false;
          Get.defaultDialog(
            title: 'Password',
            content: Container(
              padding: EdgeInsets.all(Get.width / 32),
              child: Text(
                "Erro as senha não podem ser diferente!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Layout.dark(),
                ),
              ),
            ),
          );
        }
      }
    } else {
      Get.snackbar(
        'Sem Internet',
        "verifica sua conexão com a internet!",
        snackPosition: SnackPosition.TOP,
        colorText: Layout.primaryWhite(),
        backgroundColor: Layout.danger(),
      );
    }
  }
}
