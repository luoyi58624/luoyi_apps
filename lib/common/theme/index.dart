import 'package:flutter/material.dart';

import './color_schemes.dart';

class AppTheme {
  static bool useMaterial3 = true;

  static ThemeData light = ThemeData(
    useMaterial3: useMaterial3,
    colorScheme: lightColorScheme,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: useMaterial3,
    colorScheme: darkColorScheme,
  );
}
