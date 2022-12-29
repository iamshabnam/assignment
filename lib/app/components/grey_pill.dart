import 'package:flutter/material.dart';

class GreyPill extends StatelessWidget {
  const GreyPill({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 84,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}