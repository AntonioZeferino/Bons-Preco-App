import 'package:bompreco/app/theme/layout.dart';
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Layout.primaryLight(),
  brightness: Brightness.light,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: Layout.primaryLight(.6)),
  appBarTheme: AppBarTheme(
    color: Layout.primaryLight(),
  ),
);
