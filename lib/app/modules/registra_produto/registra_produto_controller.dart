import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistraProdutoController extends GetxController {
  final formkey = GlobalKey<FormState>();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController contactoCtrl = TextEditingController();

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  RxBool valor = false.obs;
}
