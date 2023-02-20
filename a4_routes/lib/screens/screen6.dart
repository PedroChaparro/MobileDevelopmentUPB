import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:a4_routes/components/named_redirection_button.dart';
import 'package:a4_routes/screens/screen5.dart';

class Screen6 extends StatelessWidget {
  const Screen6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 6")),
      body: Center(
        child: Column(
          children: [
            const Text("Screen 6 content"),
            const NamedRedirectionButton(
                displayName: "Screen 1", route: "/screen1"),
            const NamedRedirectionButton(
                displayName: "Screen 2", route: "/screen2"),
            const NamedRedirectionButton(
                displayName: "Screen 3", route: "/screen3"),
            const NamedRedirectionButton(
                displayName: "Screen 4", route: "/screen4"),
            const NamedRedirectionButton(
                displayName: "Screen 5", route: "/screen5"),

            // Special button to test the Get package routes navigation
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  // Just use the package build-in functions to navigate to the other route
                  Get.to(() => const Screen5());
                },
                child: const Text("Redirect to \"Screen 5\" (Get package)"))
          ],
        ),
      ),
    );
  }
}
