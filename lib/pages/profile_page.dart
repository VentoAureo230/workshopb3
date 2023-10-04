import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:workshopb3/components/app_bar.dart';
import 'package:workshopb3/components/text_box.dart';
import 'package:workshopb3/theme/colors.dart';

class ProfilePage extends StatefulWidget {
  final Function()? onTap;
  const ProfilePage({super.key, this.onTap});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // user
  final currentUser = FirebaseAuth.instance.currentUser!;
  // all users
  final allUsers = FirebaseFirestore.instance.collection("Users");

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

  // edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey,
        title: Text(
          'Edit $field',
          style: const TextStyle(color: WhiteColor),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: WhiteColor),
          decoration: InputDecoration(
            hintText: 'Enter new $field',
            hintStyle: const TextStyle(color: GreyColor),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text('Save'),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );

    if (newValue.trim().isNotEmpty) {
      await allUsers.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GreyColor,
      body:StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                padding: const EdgeInsets.only(left: 15),
                children: [
                  const SizedBox(
                    height: 65,
                  ),
                  // profile picture
                  ProfilePicture(name: userData['username'], radius: 31, fontsize: 21,),
                  // user email
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // user name
                  TextBox(
                    text: userData['username'],
                    sectionName: 'Full Name',
                    onPressed: () => editField('username'),
                  ),
                  // bio
                  const SizedBox(
                    height: 15,
                  ),
                  TextBox(
                    text: userData['bio'],
                    sectionName: 'Biography',
                    onPressed: () => editField('bio'),
                  ),
                  // age
                  const SizedBox(
                    height: 15,
                  ),
                  TextBox(
                    text: userData['age'],
                    sectionName: 'Age',
                    onPressed: () => editField('age'),
                  ),
                  // exp
                  const SizedBox(
                    height: 15,
                  ),
                  TextBox(
                    text: userData['experiences'],
                    sectionName: 'Experiences',
                    onPressed: () => editField('experiences'),
                  ),
                  // diplome
                  const SizedBox(
                    height: 15,
                  ),
                  TextBox(
                    text: userData['diploma'],
                    sectionName: 'Diplomas',
                    onPressed: () => editField('diploma'),
                  ),                  
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const CircularProgressIndicator();
          }),
          
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2, // L'index de la page actuelle
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homepage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/chat');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
