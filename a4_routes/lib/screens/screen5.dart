import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:a4_routes/components/named_redirection_button.dart';
import 'package:a4_routes/screens/screen6.dart';

class Screen5 extends StatelessWidget {
  const Screen5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 5")),
      body: Center(
        child: Column(
          children: [
            const Text("Screen 5 content"),
            const NamedRedirectionButton(
                displayName: "Screen 1", route: "/screen1"),
            const NamedRedirectionButton(
                displayName: "Screen 2", route: "/screen2"),
            const NamedRedirectionButton(
                displayName: "Screen 3", route: "/screen3"),
            const NamedRedirectionButton(
                displayName: "Screen 4", route: "/screen4"),
            const NamedRedirectionButton(
                displayName: "Screen 6", route: "/screen6"),

            // Special button to test the Get package routes navigation
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Just use the package build-in functions to navigate to the other route
                  Get.to(() => const Screen6());
                },
                child: const Text("Redirect to \"Screen 6\" (Get package)"))
          ],
        ),
      ),
    );
  }
}
