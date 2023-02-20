import 'package:flutter/material.dart';

class NamedRedirectionButton extends StatelessWidget {
  final String displayName;
  final String route;
  const NamedRedirectionButton(
      {super.key, required this.displayName, required this.route});

  @override
  // Reusable button to navigate between named routes
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() {
          Navigator.pushNamed(context, route);
        }),
        child: Text("Navigate to \"$displayName\""));
  }
}
