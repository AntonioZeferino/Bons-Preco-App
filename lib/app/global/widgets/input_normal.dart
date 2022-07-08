import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputNormal extends StatelessWidget {
  const InputNormal(
      {Key? key,
      this.hintText,
      this.onChanged,
      this.icons,
      this.controller,
      this.enabled,
      this.maxLines})
      : super(key: key);

  final String? hintText;
  final ValueChanged<String>? onChanged;
  final IconData? icons;
  final controller;
  final bool? enabled;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Get.height / 99,
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
        enabled: enabled,
        maxLines: maxLines,
        //controller: controller.searchCtrl,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icons,
            color: Layout.primary(),
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
