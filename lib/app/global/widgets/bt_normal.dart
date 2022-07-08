import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';

class ButtonNormal extends StatelessWidget {
  const ButtonNormal(
      {Key? key,
      this.text,
      this.height,
      this.press,
      this.color,
      this.textColor})
      : super(key: key);

  final String? text;
  final double? height;
  final Function? press;
  final Color? color, textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(
        top: 5,
        right: 7,
        left: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Layout.primary(),
        boxShadow: [
          BoxShadow(
            color: Layout.dark(.2),
            spreadRadius: 2.0,
            blurRadius: 6.0,
          ),
        ],
      ),
      child: SizedBox.expand(
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          onPressed: press as void Function()?,
        ),
      ),
    );
  }
}
