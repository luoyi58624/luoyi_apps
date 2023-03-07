import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/model/common.dart';

import 'demo/flutter/index.dart';
import 'demo/getx/index.dart';
import 'index.dart';

class DemoTab extends StatelessWidget {
  DemoTab({super.key});

  final List<CellModel> cellNames = [
    CellModel('Flutter测试', const FlutterTestPage()),
    CellModel('Getx测试', const GetxTestPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootController.routeKeys[1],
      reportsRouteUpdateToEngine: true,
      initialRoute: '/',
      onGenerateRoute: (settings) => GetPageRoute(page: () => buildPage()),
    );
  }

  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: buildCell(),
    );
  }

  Widget buildCell() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 4,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: cellNames
                .map((e) => ListTile(
                      title: Text(e.name),
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () {
                        Get.to(e.page, id: 1);
                      },
                    ))
                .toList()),
      ),
    );
  }
}
