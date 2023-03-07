import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/global.dart';
import '../../projects/app/router.dart';
import '../../projects/todo/router.dart';
import 'index.dart';

class ProjectPage extends GetView<GlobalController> {
  ProjectPage({Key? key}) : super(key: key);

  final RootController rootController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootRouteKey.routeKeys[1],
      reportsRouteUpdateToEngine: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => GetPageRoute(page: () => buildPage()),
    );
  }

  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('项目列表'),
      ),
      body: buildBody(),
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
