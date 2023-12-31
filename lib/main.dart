import 'package:flutter/material.dart';
import 'package:workshopb3/auth/auth.dart';
import 'package:workshopb3/pages/chat_page.dart';
import 'package:workshopb3/pages/home_page.dart';
import 'package:workshopb3/pages/login.dart';
import 'package:workshopb3/pages/profile_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/chat': (context) => const ChatPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}