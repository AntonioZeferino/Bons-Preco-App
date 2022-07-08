import 'package:bompreco/app/theme/layout.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Conexao {
  String? url;
  String token = '';
  ConnectivityResult result = ConnectivityResult.none;
  RxBool net = true.obs;
  final box = GetStorage('BonsPreco');

  get() {
    //return url = 'http://100.125.42.170:8000/';
    return url = 'http://192.168.0.103:8000/';
    //return url = 'http://bginovation.com/kesongo/public/';
  }

  getConexao() {
    return url = get() + 'api/';
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

  escreverPost(
      String img,
      int preco,
      String cidade,
      String titulo,
      String descricao,
      int categoria,
      int id,
      int userId,
      String userName,
      String userContacto,
      String userImg) {
    box.write('img', img);
    box.write('titulo', titulo);
    box.write('descricao', descricao);
    box.write('preco', preco);
    box.write('categoria', categoria);
    box.write('cidade', cidade);
    box.write('estadoP', 1);
    box.write('pedido_id', id);
    box.write('user_id', userId);
    box.write('userName', userName);
    box.write('userContacto', userContacto);
    box.write('userImg', userImg);
  }
}
