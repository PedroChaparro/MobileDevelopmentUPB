import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:a4_routes/screens/screen1.dart';
import 'package:a4_routes/screens/screen2.dart';
import 'package:a4_routes/screens/screen3.dart';
import 'package:a4_routes/screens/screen4.dart';
import 'package:a4_routes/screens/screen5.dart';
import 'package:a4_routes/screens/screen6.dart';

void main() {
  // It´s necesary to use the GetMaterial app instead of the
  // Material app constructor to make the Get package navigation work.
  runApp(GetMaterialApp(
    title: "Routes",
    initialRoute: "/screen1",
    routes: {
      // Navigate with named routes
      "/screen1": (context) => const Screen1(),
      "/screen2": (context) => const Screen2(),
      "/screen3": (context) => const Screen3(),
      "/screen4": (context) => const Screen4(),
      "/screen5": (context) => const Screen5(),
      "/screen6": (context) => const Screen6(),
    },
  ));
}
