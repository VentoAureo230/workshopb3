import 'package:flutter/material.dart';
import '../components/btn_exemple.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  void deleteSomething() {} // logique de supression d'un truc

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Page")),
      body: Column(children: [
        DeleteButton(onTap: () {
          deleteSomething(); // t'appelle la logique
        })
      ]),
    );
  }
}
