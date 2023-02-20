import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:a3_login/utils/utils.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String username = '';

  // Remove the token from shared preferences and navigate to the login screen
  void _handleLogout() async {
    // Remove the token from shared preferences
    await Utils().removeFromSharedPreferences('token');

    // Navigate to the login screen
    Navigator.pushNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    _setUsernameFromToken();
  }

  // Get username from access token
  void _setUsernameFromToken() async {
    String? token = await Utils().getFromSharedPreferences('token', 'string');
    if (token == null) return;

    // Decode the token and update the state
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    setState(() {
      username = decodedToken['username'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          children: [
            Text(
              "Welcome, $username",
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () => _handleLogout(),
                child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
