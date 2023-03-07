import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global.dart';
import '../../model/common.dart';
import 'home/router_animation.dart';
import 'home/theme.dart';
import 'index.dart';

class HomePage extends GetView<GlobalController> {
  HomePage({Key? key}) : super(key: key);

  final RootController rootController = Get.find();
  final List<CellModel> cellNames = [
    CellModel('主题设置', const ThemePage()),
    CellModel('路由过渡动画', const RouterAnimationPage()),
  ];
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootRouteKey.routeKeys[0],
      reportsRouteUpdateToEngine: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => GetPageRoute(page: () => buildPage()),
    );
  }

  Widget buildPage() {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      body: buildBody(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: const Text('首页'),
      actions: [
        Obx(
          () => IconButton(
            onPressed: () {
              controller.isDark.value = !controller.isDark.value;
            },
            icon: Icon(
                controller.isDark.value ? Icons.dark_mode : Icons.light_mode),
          ),
        )
      ],
    );
  }

  Widget buildDrawer() {
    return Drawer(
      shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'luoyi',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: const Text('https://www.luoyi.website'),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage('images/home/avatars.jpg'),
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('images/home/drawer_header_bg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.8), BlendMode.hardLight),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: cellNames
                .map((e) => ListTile(
                      title: Text(e.name),
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () {
                        Get.to(e.page, id: RootRouteKey.homeKey);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return const Center(
      child: Text('首页'),
    );
  }
}
