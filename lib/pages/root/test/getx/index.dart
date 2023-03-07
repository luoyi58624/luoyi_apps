import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/common.dart';
import 'feed_back.dart';
import 'get_storage.dart';

class GetxTestPage extends StatelessWidget {
  GetxTestPage({super.key});

  final List<CellModel> cellNames = [
    CellModel('FeedBack反馈组件', const FeedBackPage()),
    CellModel('GetStorage测试', GetStoragePage()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx测试'),
      ),
      body: buildCell(),
    );
  }

  Widget buildCell() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 2,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: cellNames
                .map((e) => ListTile(
                      title: Text(e.name),
                      trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                      onTap: () {
                        Get.to(e.page);
                      },
                    ))
                .toList()),
      ),
    );
  }
}
