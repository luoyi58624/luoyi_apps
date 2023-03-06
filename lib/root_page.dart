import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/projects/todo/router.dart';

import 'projects/app/router.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luoyi App'),
      ),
      body: Center(
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
      ),
    );
  }
}
