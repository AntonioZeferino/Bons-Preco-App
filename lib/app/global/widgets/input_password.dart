import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPassword extends StatelessWidget {
  InputPassword({
    Key? key,
    this.hintText,
    this.icons,
    this.onChanged,
    this.controller,
    this.showPassword = false,
    this.changeShowPassword,
    this.enabled,
  }) : super(key: key);

  final String? hintText;
  final IconData? icons;
  final ValueChanged<String>? onChanged;
  bool showPassword;
  Function? changeShowPassword;
  final controller;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Get.height / 50,
        left: Get.height / 99,
        right: Get.height / 99,
      ),
      decoration: BoxDecoration(
        color: Layout.primaryWhite(),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          color: Layout.primaryWhite(),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Layout.dark(.1),
            spreadRadius: 2.0,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Campo requerido.';
          }
          return null;
        },
        onFieldSubmitted: (value) {
          //controller.pesquisar(value);
        },
        controller: controller,
        enabled: enabled,
        obscureText: showPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icons,
            color: Layout.primary(),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              showPassword ? Icons.visibility_off : Icons.visibility,
              color: Layout.primary(),
              size: 30,
            ),
            onPressed: changeShowPassword as void Function()?,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Layout.dark(),
          ),
        ),
      ),
    );
  }
}
