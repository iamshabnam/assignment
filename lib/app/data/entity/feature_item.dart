import 'package:flutter/material.dart';

class FeatureItem {
  final String title;
  final IconData icon;
  final Color iconColor;

  FeatureItem(
    this.title, [
    this.icon = Icons.add,
    this.iconColor = const Color(0xFF000000),
  ]);
}
