import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VoltarTop extends StatelessWidget {
  const VoltarTop({
    Key? key,
    required this.titulo,
  }) : super(key: key);
  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Layout.primaryWhite(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Icon(
                Icons.arrow_back,
                color: Layout.primary(),
                size: 30,
              ),
            ),
          ),
          Text(
            titulo,
            style: TextStyle(
              color: Layout.primary(),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: Get.width / 35,
            //height: 3,
            color: Layout.primaryWhite(),
          ),
        ],
      ),
    );
  }
}
