import 'package:flutter/material.dart';
import 'package:news_appgetx/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // Warna Tema Aplikasi
  static const Color beige = Color(0xFF2196F3);
  static const Color navy = Color.fromARGB(255, 0, 10, 71);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App futem',
      home: SplashScreenPage(),
    );
  }
}
