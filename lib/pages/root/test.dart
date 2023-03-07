import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/common.dart';
import 'test/flutter/index.dart';
import 'test/getx/index.dart';
import 'test/other/index.dart';
import 'index.dart';

class TestPage extends StatelessWidget {
  TestPage({super.key});

  final List<CellModel> cellNames = [
    CellModel('Flutter测试', FlutterTestPage()),
    CellModel('Getx测试', GetxTestPage()),
    CellModel('Other测试', const OtherTestPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootRouteKey.routeKeys[3],
      reportsRouteUpdateToEngine: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => GetPageRoute(page: () => buildPage()),
    );
  }

  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo测试'),
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
                      Get.to(e.page, id: RootRouteKey.testKey);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
