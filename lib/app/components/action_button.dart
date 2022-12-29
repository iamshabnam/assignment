import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, this.icon}) : super(key: key);

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      child: Icon(icon, color: Colors.black87, size: 20),
    );
  }
}
