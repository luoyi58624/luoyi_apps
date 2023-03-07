import 'package:flutter/material.dart';

class GetxTestPage extends StatelessWidget {
  const GetxTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx测试'),
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
