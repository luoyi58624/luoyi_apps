import 'package:get/get.dart';
import 'package:luoyi_apps/projects/app/router.dart';
import 'package:luoyi_apps/projects/todo/router.dart';

import 'root_page.dart';

abstract class Routes {
  static const root = '/';
}

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.root,
      page: () {
        return const RootPage();
      },
    ),
    ...AppPages.pages,
    ...TodoPages.pages,
  ];
}
