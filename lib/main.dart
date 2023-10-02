import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: const AuthPage(),
      routes: {
        //'/homepage': (context) => const HomePage(),
        //'/profile': (context) => const ProfilePage(),
        //'/settings': (context) => const SettingsPage(),
      },
    );
  }
}