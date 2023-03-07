import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RouterAnimationPage extends StatelessWidget {
  const RouterAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由过渡动画'),
      ),
      body: buildCell(),
    );
  }

  Widget buildCell() {
    List transitions = [];
    for (var value in Transition.values) {
      transitions.add(value.name);
    }
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: Transition.values
            .map((e) => ListTile(
                  title: Text(e.name),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {
                    Get.to(const RouterAnimationDetailPage(), transition: e);
                  },
                ))
            .toList(),
      ),
    );
  }
}

class RouterAnimationDetailPage extends StatelessWidget {
  const RouterAnimationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('路由动画详情页'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('返回动画列表'),
        ),
      ),
    );
  }
}
