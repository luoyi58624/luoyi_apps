import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/global.dart';
import '../../model/common.dart';
import 'home.dart';
import 'project.dart';
import 'test.dart';
import 'user.dart';
import 'web.dart';

class RootController extends GetxController {
  final RxInt tabbarIndex = 0.obs;
}

class RootPage extends GetView<RootController> {
  RootPage({super.key});

  final GlobalController globalController = Get.find();

  final List<Widget> tabPages = <Widget>[
    HomePage(),
    ProjectPage(),
    const WebPage(),
    TestPage(),
    const UserPage(),
  ];

  final List<BottomBar> bottomBars = <BottomBar>[
    const BottomBar('首页', Icons.home),
    const BottomBar('项目', Icons.turned_in),
    const BottomBar('Web页', Icons.language),
    const BottomBar('测试', Icons.bug_report),
    const BottomBar('我的', Icons.people),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          final NavigatorState navigator = RootRouteKey
              .routeKeys[controller.tabbarIndex.value].currentState!;
          if (!navigator.canPop()) {
            return true;
          }
          navigator.pop();
          return false;
        },
        child: Scaffold(
          body: buildBody(),
          bottomNavigationBar: globalController.useMaterial3.value
              ? buildMaterial3Tabbar()
              : buildMaterial2Tabbar(),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Obx(
      () => IndexedStack(
        index: controller.tabbarIndex.value,
        children: tabPages,
      ),
    );
  }

  Widget buildMaterial2Tabbar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.tabbarIndex.value,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: bottomBars.map((BottomBar item) {
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
        destinations: bottomBars.map((BottomBar destination) {
          return NavigationDestination(
            icon: Icon(destination.icon),
            label: destination.title,
          );
        }).toList(),
      ),
    );
  }
}

// 定义选项卡式根路由 key
abstract class RootRouteKey {
  // 跳转嵌套路由指定的 id
  static const int homeKey = 1;
  static const int projectKey = 2;
  static const int webKey = 3;
  static const int testKey = 4;
  static const int userKey = 5;

  static final List<GlobalKey<NavigatorState>> routeKeys = [
    Get.nestedKey(homeKey)!,
    Get.nestedKey(projectKey)!,
    Get.nestedKey(webKey)!,
    Get.nestedKey(testKey)!,
    Get.nestedKey(userKey)!,
  ];
}
