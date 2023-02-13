import 'package:flutter/material.dart';
import 'package:session/screens/home_screen.dart';
import 'package:session/screens/login.dart';

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
