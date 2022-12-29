import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.onChanged,
  }) : super(key: key);
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(48),
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: 'Search features',
        ),
      ),
    );
  }
}
