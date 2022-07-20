import 'dart:io';

import 'package:bompreco/app/data/repository/user.repository.dart';
import 'package:bompreco/app/routes/app_routes.dart';
import 'package:bompreco/app/theme/layout.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Conexao {
  String? url;
  String token = '';
  final repositoryUser = AuthUserRepository();
  ConnectivityResult result = ConnectivityResult.none;
  RxBool net = true.obs;
  final box = GetStorage('BonsPreco');

  get() {
    //return url = 'http://192.168.43.87:8000/';
    return url = 'http://192.168.0.100:8000/';
    //return url = 'http://bginovation.com/kesongo/public/';
  }

  getConexao() {
    return url = get() + 'api/';
  }

  getImgProduto() {
    return url = get() + "storage/imgProduto/";
  }

  getImgParceiro() {
    return url = get() + "storage/imgParceiro/";
  }

  verificaConexao() async {
    result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      net.value = true;
      return true;
    } else {
      net.value = false;
      return false;
    }
  }

  snackbarSMS(String title, String corpo) {
    Get.snackbar(
      title,
      corpo,
      titleText: Text(
        title,
        style: TextStyle(
          color: Layout.primaryWhite(),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        corpo,
        style: TextStyle(
          color: Layout.primaryWhite(),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Layout.primaryWhite(),
      backgroundColor: Layout.primary(),
    );
  }

  dialogSMS(String title, String corpo) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        fontSize: 22,
        color: Layout.dark(),
        fontWeight: FontWeight.bold,
      ),
      content: Container(
        padding: EdgeInsets.all(Get.width / 32),
        child: Text(
          corpo,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Layout.dark(),
          ),
        ),
      ),
    );
  }

  dialogConfirm(String title, String corpo, Function? press) {
    Get.defaultDialog(
      title: title,
      titleStyle: TextStyle(
        fontSize: 22,
        color: Layout.dark(),
        fontWeight: FontWeight.bold,
      ),
      content: Container(
        padding: EdgeInsets.all(Get.width / 32),
        child: Text(
          corpo,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Layout.dark(),
          ),
        ),
      ),
      textConfirm: 'Sim',
      confirmTextColor: Layout.primaryWhite(),
      onConfirm: press as void Function()?,
      textCancel: 'Não',
      onCancel: () {},
    );
  }

  logout() async {
    token = box.read('accessToken');
    if (token.isNotEmpty) {
      bool s = await repositoryUser.logout(token);
      print('Sair:' + s.toString());
      box.remove('user');
      box.remove('accessToken');
      Get.offAllNamed(Routes.HOME);
    } else {
      exit(0);
    }
  }
}
