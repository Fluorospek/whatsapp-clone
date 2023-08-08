import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/camera_screen.dart';
import 'package:whatsapp_clone/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  camera = await availableCameras();
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
      home: LoginPage(),
    );
  }
}
