import 'package:flutter/material.dart';

class UserText extends StatelessWidget {
  final String text;
  const UserText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        // To separete each text vertically
        padding: const EdgeInsets.all(2.0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
