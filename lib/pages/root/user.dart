import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: RootRouteKey.routeKeys[4],
      reportsRouteUpdateToEngine: false,
      initialRoute: '/',
      onGenerateRoute: (settings) => GetPageRoute(page: () => buildPage()),
    );
  }

  Widget buildPage() {
    return Scaffold(
      appBar: AppBar(title: const Text('我的')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('hello'),
        ),
      ),
    );
  }
}
