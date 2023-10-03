import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:workshopb3/components/app_bar.dart';
=======
import 'package:workshopb3/theme/colors.dart';
>>>>>>> develop

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // L'index de la page actuelle
        onTap: (index) {
          // Gérez la navigation vers la page correspondante ici
          if (index == 0) {
            // Naviguez vers la page d'accueil (HomePage)
            Navigator.pushReplacementNamed(context, '/homepage');
          } else if (index == 1) {
            // Naviguez vers la page de profil (ChatPage)
            Navigator.pushReplacementNamed(context, '/chat');
          } else if (index == 2) {
            // Naviguez vers la page de chat (ProfilePage)
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
=======
      appBar: AppBar(title: const Text("Profile Page", style: TextStyle(color: BlackColor))),
>>>>>>> develop
    );
  }
}
