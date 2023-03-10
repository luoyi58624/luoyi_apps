import 'package:get/get.dart';

import 'pages/root/index.dart';

abstract class AppRoutes {
  static const root = '/app';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.root,
      page: () => const RootPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => RootController(), tag: 'app');
      }),
    ),
  ];
}
