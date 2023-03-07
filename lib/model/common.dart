import 'package:flutter/material.dart';

class BottomBar {
  const BottomBar(this.title, this.icon);

  final String title;
  final IconData icon;
}

class CellModel {
  final String name;
  final Widget page;

  CellModel(this.name, this.page);
}
