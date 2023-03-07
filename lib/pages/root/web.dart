import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootRouteKey.routeKeys[2],
      reportsRouteUpdateToEngine: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => GetPageRoute(page: () => buildPage()),
    );
  }

  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(title: const Text('Web页面')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('商城项目'),
        ),
      ),
    );
  }
}
