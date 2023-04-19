import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: const Color(0xFF128C7E)),
      ),
      home: HomeScreen(),
    );
  }
}
