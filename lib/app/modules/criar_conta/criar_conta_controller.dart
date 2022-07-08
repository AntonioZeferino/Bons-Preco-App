import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CriarContaController extends GetxController {
  final formkey = GlobalKey<FormState>();
  TextEditingController nomeCtrl = TextEditingController();
  TextEditingController contactoCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController password1Ctrl = TextEditingController();
  TextEditingController password2Ctrl = TextEditingController();
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;
  RxBool valor = false.obs;
}
