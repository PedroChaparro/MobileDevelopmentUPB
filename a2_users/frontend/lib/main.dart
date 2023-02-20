import 'package:flutter/material.dart';
import 'package:a2_users/screens/users_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Users list',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const UsersList(),
    );
  }
}
