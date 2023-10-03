import 'package:firebase_auth/firebase_auth.dart';
import 'package:workshopb3/auth/log_or_reg.dart';
import 'package:flutter/material.dart';

import '../pages/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          }
          return const LogOrReg();
        },
      ),
    );
  }
}