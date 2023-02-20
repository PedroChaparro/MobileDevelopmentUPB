import 'package:flutter/material.dart';
import 'package:a4_routes/components/named_redirection_button.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 1")),
      body: Center(
        child: Column(
          children: const [
            Text("Screen 1 content"),
            NamedRedirectionButton(displayName: "Screen 2", route: "/screen2"),
            NamedRedirectionButton(displayName: "Screen 3", route: "/screen3"),
            NamedRedirectionButton(displayName: "Screen 4", route: "/screen4"),
            NamedRedirectionButton(displayName: "Screen 5", route: "/screen5"),
            NamedRedirectionButton(displayName: "Screen 6", route: "/screen6"),
          ],
        ),
      ),
    );
  }
}
