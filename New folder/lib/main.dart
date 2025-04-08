import 'package:flutter/material.dart';
import 'user_interface.dart';

void main() {
  runApp(const MoodTrackerApp());
}

class MoodTrackerApp extends StatelessWidget {
  const MoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 94, 63, 181)),
        appBarTheme: AppBarTheme(
          color: const Color.fromARGB(255, 181, 63, 154),
          titleTextStyle: TextStyle(color: const Color.fromARGB(255, 214, 162, 214), fontSize: 22),
        ),
      ),
      home: MoodTrackerPage(),
    );
  }
}
