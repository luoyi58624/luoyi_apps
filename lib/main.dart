import 'package:flutter/material.dart';
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
        initialRoute: Routes.root,
        getPages: Pages.pages,
      ),
    );
  }
}
