import 'package:flutter/material.dart';

class Layout {
  static Color primary([double opacity = 1]) =>
      Colors.blue.withOpacity(opacity);
  static Color primaryLight([double opacity = 1]) =>
      const Color(0xD9B594).withOpacity(opacity);
  static Color primaryDark([double opacity = 1]) =>
      Colors.black.withOpacity(opacity);
  static Color primaryWhite([double opacity = 1]) =>
      Colors.white.withOpacity(opacity);

  static Color secondary([double opacity = 1]) =>
      Colors.green[900]!.withOpacity(opacity);
  static Color secondaryLight([double opacity = 1]) =>
      Color.fromRGBO(37, 63, 31, opacity);
  static Color secondaryDark([double opacity = 1]) =>
      Color.fromARGB(0, 83, 81, 94).withOpacity(opacity);

  static Color light([double opacity = 1]) =>
      Color.fromRGBO(230, 230, 230, opacity);
  static Color dark([double opacity = 1]) => primaryDark(opacity);

  static Color danger([double opacity = 1]) =>
      Color.fromRGBO(217, 74, 74, opacity);
  static Color success([double opacity = 1]) =>
      Color.fromRGBO(5, 100, 50, opacity);
  static Color info([double opacity = 1]) =>
      Color.fromRGBO(100, 150, 255, opacity);
  static Color warning([double opacity = 1]) =>
      Color.fromRGBO(250, 200, 70, opacity);
}
