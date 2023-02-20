import 'package:flutter/material.dart';
import 'package:a4_routes/components/named_redirection_button.dart';
import 'package:a4_routes/screens/screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 3")),
      body: Center(
        child: Column(
          children: [
            const Text("Screen 3 content"),
            const NamedRedirectionButton(
                displayName: "Screen 1", route: "/screen1"),
            const NamedRedirectionButton(
                displayName: "Screen 2", route: "/screen2"),
            const NamedRedirectionButton(
                displayName: "Screen 4", route: "/screen4"),
            const NamedRedirectionButton(
                displayName: "Screen 5", route: "/screen5"),
            const NamedRedirectionButton(
                displayName: "Screen 6", route: "/screen6"),

            // Special button to test the Material Page route navigation
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Screen4()));
                },
                child: const Text("Redirect to \"Screen 4\""))
          ],
        ),
      ),
    );
  }
}
