import 'package:flutter/material.dart';

class ToolPage extends StatefulWidget {
  const ToolPage({super.key});

  @override
  State<ToolPage> createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('工具'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text('count: $count'),
        ),
      ),
    );
  }
}
