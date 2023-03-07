import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/controller/global.dart';
import 'package:luoyi_apps/pages/root/index.dart';
import 'package:luoyi_apps/projects/app/router.dart';
import 'package:luoyi_apps/projects/todo/router.dart';
import 'package:luoyi_apps/router.dart';

class ProjectTab extends GetView<GlobalController> {
  ProjectTab({Key? key}) : super(key: key);

  final GlobalController globalController = Get.find();
  final RootController rootController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootController.routeKeys[0],
      reportsRouteUpdateToEngine: true,
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
      title: const Text('Luoyi App'),
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
          ListTile(
            title: const Text('项目列表'),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {
              Get.toNamed(Routes.projectList);
            },
          ),
          ListTile(
            title: const Text('任务列表'),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {
              Get.toNamed(Routes.taskList);
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('GetX测试'),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {
              Get.toNamed(Routes.getx);
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('路由过渡动画'),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {
              Get.toNamed(Routes.routerAnimation);
              // Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('主题设置'),
            trailing: const Icon(Icons.keyboard_arrow_right_outlined),
            onTap: () {
              Get.toNamed(Routes.theme);
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.toNamed(AppRoutes.root);
            },
            child: const Text('我的App'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(TodoRoutes.root);
            },
            child: const Text('todo项目'),
          ),
        ],
      ),
    );
  }
}
