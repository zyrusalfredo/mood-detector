import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MoodSenseApp());
}

class MoodSenseApp extends StatelessWidget {
  const MoodSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoodSense',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1020),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}