import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  const MyAvatar({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: 60,
      width: 60,
    );
  }
}