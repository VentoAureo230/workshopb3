import 'package:flutter/material.dart';
import 'package:workshopb3/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/homepage': (context) => HomePage(),
        //'/profile': (context) => const ProfilePage(),
        //'/settings': (context) => const SettingsPage(),
      },
    );
  }
}