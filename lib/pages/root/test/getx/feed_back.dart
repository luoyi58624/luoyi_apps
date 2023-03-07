import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackPage extends StatelessWidget {
  const FeedBackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX反馈组件')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  '提示',
                  '这是一条snackbar消息',
                  backgroundColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 300),
                  isDismissible: true,
                  onTap: (snack) {
                    Get.back();
                  },
                );
              },
              child: const Text('弹出 snackbar'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: '提示',
                  middleText: "这是一个默认的Dialog组件",
                  radius: 4,
                  confirm: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('确认'),
                  ),
                  cancel: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('取消'),
                  ),
                );
              },
              child: const Text('弹出默认的 dialog'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  backgroundColor: Colors.white,
                  Wrap(
                    children: [
                      ListTile(
                          leading: const Icon(Icons.music_note),
                          title: const Text('Music'),
                          onTap: () {}),
                      ListTile(
                        leading: const Icon(Icons.videocam),
                        title: const Text('Video'),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              },
              child: const Text('弹出 bottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
