import 'package:flutter/material.dart';
import 'package:clothing_stores_ui/Views/app_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const app_main_screen(), // Use consistent naming
    );
  }
}
