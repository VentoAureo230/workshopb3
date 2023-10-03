import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workshopb3/components/app_bar.dart';
import 'package:workshopb3/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // log out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      body: Center(child: TextButton(onPressed: signOut, child: const Text("Sign Out"),)),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // L'index de la page actuelle
        onTap: (index) {
          // Gérez la navigation vers la page correspondante ici
          if (index == 0) {
            // Naviguez vers la page d'accueil (HomePage)
            Navigator.pushNamed(context, '/homepage');
          } else if (index == 1) {
            // Naviguez vers la page de profil (ChatPage)
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            // Naviguez vers la page de chat (ProfilePage)
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
