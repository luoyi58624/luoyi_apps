import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff2196f3), // 主要颜色
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD3E3FF),
  onPrimaryContainer: Color(0xFF001C39),
  secondary: Color(0xFF0061A3),
  onSecondary: Color(0xFFFFFFFF),

  tertiary: Color(0xFF7F5700),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDEAD),
  onTertiaryContainer: Color(0xFF281900),
  error: Color(0xFFBA1A1A),
  onError: Color(0xFFFFFFFF),
  background: Color(0xfffdfdfd), // 容器背景
  onBackground: Color(0xFFFDFBFF), // 按钮边框颜色
  surface: Color(0xfff6f6f6), // 头部导航、card卡片等背景色
  onSurface: Color(0xff222222), // 文字颜色
  surfaceTint: Color(0xFFFFFFFF), // 作用于drawer背景色
  surfaceVariant: Color(0xFFDFE2EB),
  onSurfaceVariant: Color(0xFF43474E),
  outline: Color(0xFF73777f), // 边框按钮的颜色
  onInverseSurface: Color(0xFFECF0FF),
  inversePrimary: Color(0xFFA3C9FF),
  shadow: Color(0xFF000000),
  outlineVariant: Color(0xFFC3C6CF),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff2196f3), // 主要颜色
  onPrimary: Color(0x00000000),
  secondary: Color(0xff2196f3), // 黑暗模式下tabbar激活颜色
  onSecondary: Color(0x00000000),
  tertiary: Color(0xFFFFBA3C),
  onTertiary: Color(0xFF432C00),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xff343a40), // 容器背景
  onBackground: Color(0xFFD6E3FF),
  surface: Color(0xff212529), // 头部导航、card卡片等背景色
  onSurface: Color(0xfff1f1f1), // 文字颜色
  surfaceTint: Color(0xFFFFFFFF), // 作用于drawer背景色
);
