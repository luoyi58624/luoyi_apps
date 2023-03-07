import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/global.dart';
import '../../model/common.dart';
import 'project.dart';
import 'demo.dart';

class RootController extends GetxController {
  static final List<Widget> tabPages = <Widget>[
    ProjectTab(),
    DemoTab(),
  ];

  static final List<BottomBar> bottomBars = <BottomBar>[
    const BottomBar('项目列表', Icons.home),
    const BottomBar('Demo测试', Icons.bug_report)
  ];

  static final List<GlobalKey<NavigatorState>> routeKeys =
      List<GlobalKey<NavigatorState>>.generate(
          tabPages.length, (int index) => Get.nestedKey(index)!).toList();

  final RxInt tabbarIndex = 0.obs;
}

class RootPage extends GetView<RootController> {
  RootPage({super.key});

  final GlobalController globalController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          final NavigatorState navigator = RootController
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
        children: RootController.tabPages,
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
