import 'package:flutter/material.dart';

class ImPage extends StatelessWidget {
  const ImPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('消息'),
        ),
        body: const Center(
          child: Text('消息'),
        ));
  }
}
