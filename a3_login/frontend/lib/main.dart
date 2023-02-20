import 'package:flutter/material.dart';
import 'package:a3_login/screens/home_screen.dart';
import 'package:a3_login/screens/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Session',
    initialRoute: '/login',
    routes: {
      '/login': (context) => const LoginScreen(),
      '/home': (context) => const HomeScreen(),
    },
  ));
}
