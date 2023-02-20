import 'package:flutter/material.dart';
import 'package:a4_routes/components/named_redirection_button.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 4")),
      body: Center(
        child: Column(
          children: [
            const Text("Screen 4 content"),
            const NamedRedirectionButton(
                displayName: "Screen 1", route: "/screen1"),
            const NamedRedirectionButton(
                displayName: "Screen 2", route: "/screen2"),
            const NamedRedirectionButton(
                displayName: "Screen 3", route: "/screen3"),
            const NamedRedirectionButton(
                displayName: "Screen 5", route: "/screen5"),
            const NamedRedirectionButton(
                displayName: "Screen 6", route: "/screen6"),

            // Special button to test the Material Page route navigation
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Redirect to the previous route
                  Navigator.pop(context);
                },
                child: const Text("Redirect to \"Screen 3\" (Go back)"))
          ],
        ),
      ),
    );
  }
}
