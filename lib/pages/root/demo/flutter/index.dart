import 'package:flutter/material.dart';

class FlutterTestPage extends StatelessWidget {
  const FlutterTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter测试'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('count'),
        ),
      ),
    );
  }
}
