import 'package:flutter/material.dart';
import 'package:workshopb3/components/app_bar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("ChatBox")),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // L'index de la page actuelle
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
    );
  }
}