import 'package:bompreco/app/data/conexao.dart';
import 'package:bompreco/app/data/model/token.dart';
import 'package:bompreco/app/data/model/user.dart';
import 'package:bompreco/app/data/repository/user.repository.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final box = GetStorage('BonsPreco');
  final formKey = GlobalKey<FormState>();
  final repository = AuthUserRepository();

  TextEditingController userCtrl = TextEditingController();
  TextEditingController passeCtrl = TextEditingController();

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void verificaLogin(BuildContext context) async {
    Conexao().verificaConexao();
    if (Conexao().net.value) {
      if (formKey.currentState!.validate()) {
        loading.value = true;
        Token token = await repository
            .login(userCtrl.text.toString(), passeCtrl.text.toString())
            .catchError((onError) {
          loading.value = false;
        });
        loading.value = false;
        if (token.accessToken != null) {
          User? user = await repository.userMe(token.accessToken.toString());

          box.write('accessToken', token.accessToken);
          box.write('tokenType', token.tokenType);

          //print(token.accessToken.toString());
          if (user != null) {
            box.write('user', user.toJson());
          }
          Get.offAllNamed(Routes.HOME);
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
