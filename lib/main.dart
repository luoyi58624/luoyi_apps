import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/global.dart';
import 'router.dart';

void main() async {
  await GetStorage.init(); // 创建持久化容器
  Get.put(GlobalController());
  runApp(const MainApp());
}

class MainApp extends GetView<GlobalController> {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GetMaterialApp(
        title: 'Luoyi App',
        debugShowCheckedModeBanner: false,
        theme: controller.appTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CH'),
          Locale('en', 'US'),
        ],
        // translations: Messages(), // 你的翻译
        locale: const Locale('zh', 'CN'), // 将会按照此处指定的语言翻译
        fallbackLocale: const Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
        initialRoute: Routes.root,
        getPages: Pages.pages,
      ),
    );
  }
}
