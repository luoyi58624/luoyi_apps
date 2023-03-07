import 'package:flutter/material.dart';

class OtherTestPage extends StatelessWidget {
  const OtherTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('其他测试'),
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
