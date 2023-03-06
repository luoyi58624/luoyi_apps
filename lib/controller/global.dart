import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../common/theme/color_schemes.dart';

class GlobalController extends GetxController {
  final storage = GetStorage();
  final RxBool useMaterial3 = false.obs; // 使用material3风格
  final RxBool isDark = Get.isDarkMode.obs; // 开启黑暗模式

  ThemeData get appTheme {
    if (useMaterial3.value) {
      return ThemeData(
        useMaterial3: true,
        colorScheme: isDark.value ? darkColorScheme : lightColorScheme,
      );
    } else {
      return isDark.value ? ThemeData.dark() : ThemeData.light();
    }
  }

  @override
  void onInit() {
    super.onInit();

    useMaterial3.value = storage.read('useMaterial3') ?? false;
    isDark.value = storage.read('isDark') ?? false;
    useMaterial3.listen((p0) {
      storage.write('useMaterial3', p0);
    });
    isDark.listen((p0) {
      storage.write('isDark', p0);
    });
  }
}
