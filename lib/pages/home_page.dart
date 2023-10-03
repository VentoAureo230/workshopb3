// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workshopb3/components/app_bar.dart';
import 'package:workshopb3/theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Go to profile
  void goToProfilePage() {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/profile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      body: 
      const Center(
        child: Text('Contenu de la page d\'accueil'),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0, // L'index de la page actuelle
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