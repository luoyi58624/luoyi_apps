import 'package:get/get.dart';
import 'package:luoyi_apps/projects/app/router.dart';
import 'package:luoyi_apps/projects/todo/router.dart';

import 'pages/root/index.dart';

abstract class Routes {
  static const root = '/';
  static const projectList = '/project/list';
  static const taskList = '/task/list';
  static const getx = '/getx';
  static const routerAnimation = '/routerAnimation';
  static const theme = '/theme';
}

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.root,
      page: () => RootPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut<RootController>(() => RootController());
      }),
    ),
    ...AppPages.pages,
    ...TodoPages.pages,
  ];
}
