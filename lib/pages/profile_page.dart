import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:workshopb3/components/app_bar.dart';
import 'package:workshopb3/components/text_field.dart';
import 'package:workshopb3/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  final Function()? onTap;
  const ProfilePage({super.key, this.onTap});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final bioController = TextEditingController();
  final expController = TextEditingController();
  final diplomaController = TextEditingController();

  // log out
  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  void saveData() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (nameController.text.isEmpty || ageController.text.isEmpty) {
      Navigator.pop(context);
      displayMessage("Please enter a name and your age !");
    }

    try {
      UserCredential userCreds =
          (await FirebaseAuth.instance.currentUser) as UserCredential;

      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCreds.user!.email)
          .set({
        'Full name': nameController.text,
        'Age': ageController.text,
        'Biography': bioController.text,
        'Experience': expController.text,
        'Diploma': diplomaController.text,
      });
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      body: Column(
        children: [
          Text("Profile Page"),
          SizedBox(
            height: 25,
          ),
          Text("Full name"),
          SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: nameController, hintText: "Doe", obscureText: false),
          SizedBox(
            height: 25,
          ),
          Text("Age"),
          SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: ageController, hintText: "18", obscureText: false),
          SizedBox(
            height: 25,
          ),
          Text("Biography"),
          SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: bioController,
              hintText: "Say something nice about yourself !",
              obscureText: false),
          SizedBox(
            height: 25,
          ),
          Text("Experiences"),
          SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: expController,
              hintText: "What are some of your recent experiences ?",
              obscureText: false),
          SizedBox(
            height: 25,
          ),
          Text("Diplomas"),
          SizedBox(
            height: 25,
          ),
          MyTextField(
              controller: diplomaController,
              hintText: "PhD,Licence,...",
              obscureText: false),
        ],
      ),
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
