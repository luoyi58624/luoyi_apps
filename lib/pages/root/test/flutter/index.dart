import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:luoyi_apps/model/common.dart';
import 'package:luoyi_apps/pages/root/index.dart';

import 'button.dart';
import 'date.dart';

class FlutterTestPage extends StatelessWidget {
  FlutterTestPage({super.key});

  final List<CellModel> cellNames = [
    CellModel('按钮', const FlutterButtonPage()),
    CellModel('日期选择', const FlutterDatePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter测试'),
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
