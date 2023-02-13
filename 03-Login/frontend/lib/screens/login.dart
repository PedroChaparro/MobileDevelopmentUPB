import 'package:flutter/material.dart';
import 'package:session/components/form_input.dart';
import 'package:session/services/session.services.dart';
import 'package:session/utils/utils.dart';

// Globarl session service
var _sessionService = SessionServices();

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '';
  String password = '';
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _validateSession();
  }

  void _validateSession() async {
    // Get the token from shared preferences
    String? token = await Utils().getFromSharedPreferences('token', 'string');

    // If the token is not null, navigate to the home screen
    if (token != null) {
      Navigator.pushNamed(context, '/home');
    }
  }

  void _updateState(field, value) {
    setState(() {
      switch (field) {
        case 'username':
          username = value;
          break;
        case 'password':
          password = value;
          break;
      }
    });
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> response = await _sessionService
          .postLoginEndpoint({'username': username, 'password': password});

      // Get token from the response and save to shared preferences
      String token = response['accessToken'];
      final wasTokenSaved =
          await Utils().saveToSharedPreferences('token', token, 'string');

      // Navigate to the home screen if the token was successfully saved
      if (wasTokenSaved) {
        Navigator.pushNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login",
      home: Scaffold(
          appBar: AppBar(title: const Text("Login")),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // Flutter image
                  Container(
                      margin: const EdgeInsets.all(16.0),
                      child: Image.asset("assets/flutter.png", width: 200)),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Input 1
                        FormInput(
                          updateStateCallback: _updateState,
                          placeholder: 'Username',
                          field: 'username',
                          isPrivate: false,
                        ),
                        // Input 2
                        FormInput(
                          updateStateCallback: _updateState,
                          placeholder: 'Password',
                          field: 'password',
                          isPrivate: true,
                        ),
                        // Login button
                        ElevatedButton(
                            onPressed: () => _submitForm(),
                            child: const Text("Login"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
