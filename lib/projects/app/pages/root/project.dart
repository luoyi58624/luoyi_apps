import 'package:flutter/material.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('项目圈'),
        ),
        body: const Center(
          child: Text('项目圈'),
        ));
  }
}
