import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/utils/logger.dart';

class GetStorageControll extends GetxController {
  var getStorageTest = ''.obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();

    getStorageTest.value = storage.read('get_storage_test') ?? '';
    logger.i('get_storage初始化: ${getStorageTest.value}');
    // 当controll卸载时将自动销毁
    getStorageTest.listen((p0) {
      logger.i('get_storage_test变更同步: $p0');
      storage.write('get_storage_test', p0);
    });
  }
}

class GetStoragePage extends StatelessWidget {
  GetStoragePage({super.key});

  final GetStorageControll controll = Get.put(GetStorageControll());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStorage存储测试'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          TextFormField(
            initialValue: controll.getStorageTest.value,
            decoration: const InputDecoration(
              labelText: '持久化存储 - [get_storage_test]',
            ),
            onChanged: (value) {
              controll.getStorageTest.value = value;
            },
          ),
        ]),
      ),
    );
  }
}
