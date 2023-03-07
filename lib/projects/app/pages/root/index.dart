import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/common/utils/logger.dart';

import 'home.dart';
import 'tool.dart';
import 'project.dart';
import 'im.dart';
import 'user.dart';

class RootController extends GetxController {
  static final List<Widget> rootPages = <Widget>[
    const HomePage(),
    const ToolPage(),
    const ProjectPage(),
    const ImPage(),
    const UserPage(),
  ];
  static final List<BottomBar> bottomBars = <BottomBar>[
    const BottomBar(0, '首页', Icons.home),
    const BottomBar(1, '工具', Icons.widgets),
    const BottomBar(2, '项目圈', Icons.school),
    const BottomBar(3, '消息', Icons.chat),
    const BottomBar(4, '我的', Icons.person),
  ];
  static final List<GlobalKey<NavigatorState>> routeKeys =
      List<GlobalKey<NavigatorState>>.generate(
          rootPages.length, (int index) => Get.nestedKey(index + 1)!).toList();

  final RxInt tabbarIndex = 0.obs; // tabbar激活的索引
}

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  // ignore: overridden_fields
  final String tag = "app";

  @override
  Widget build(BuildContext context) {
    logger.i('app page已加载');
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildMaterial2Tabbar(),
    );
  }

  Widget buildBody() {
    return Obx(
      () => IndexedStack(
        index: controller.tabbarIndex.value,
        children: RootController.rootPages,
      ),
    );
  }

  Widget buildMaterial2Tabbar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.tabbarIndex.value,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: RootController.bottomBars.map((BottomBar item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.title,
          );
        }).toList(),
        onTap: (int index) {
          controller.tabbarIndex.value = index;
        },
      ),
    );
  }

  Widget buildMaterial3Tabbar() {
    return Obx(
      () => NavigationBar(
        onDestinationSelected: (int index) {
          controller.tabbarIndex.value = index;
        },
        selectedIndex: controller.tabbarIndex.value,
        destinations: RootController.bottomBars.map((BottomBar destination) {
          return NavigationDestination(
            icon: Icon(destination.icon),
            label: destination.title,
          );
        }).toList(),
      ),
    );
  }
}

class BottomBar {
  const BottomBar(this.index, this.title, this.icon);

  final int index;
  final String title;
  final IconData icon;
}
