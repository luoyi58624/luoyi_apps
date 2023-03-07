import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/projects/todo/router.dart';

class TodoRootController extends GetxController {
  final RxInt tabbarIndex = 0.obs; // tabbar激活的索引
}

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final TodoRootController controller = Get.put(TodoRootController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的任务')),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(TodoRoutes.addTask);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildTabbar(),
    );
  }

  Widget buildBody() {
    return const Center(
      child: Text('home'),
    );
  }

  Widget buildTabbar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.calendar_today_sharp),
            onPressed: () {
              Get.toNamed(TodoRoutes.calendar);
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.toNamed(TodoRoutes.user);
            },
          ),
        ],
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
