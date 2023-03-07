import 'package:flutter/material.dart';

class FlutterButtonPage extends StatefulWidget {
  const FlutterButtonPage({super.key});

  @override
  State<FlutterButtonPage> createState() => _FlutterButtonPageState();
}

class _FlutterButtonPageState extends State<FlutterButtonPage> {
  int count = 0;

  void addCount() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter按钮'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: addCount,
              child: Text('count: $count'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: addCount,
              child: Text('count: $count'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: addCount,
              child: Text('count: $count'),
            ),
          ],
        ),
      ),
    );
  }
}
