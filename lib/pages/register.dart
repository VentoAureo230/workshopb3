import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/login_button.dart';
import '../components/text_field.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordTextController.text != confirmPasswordTextController.text) {
      Navigator.pop(context);
      displayMessage("Password don't match !");
      return;
    }

    try {
      UserCredential userCreds = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailTextController.text,
              password: passwordTextController.text);

      FirebaseFirestore.instance
          .collection("Users")
          .doc(userCreds.user!.email)
          .set({
        'username': emailTextController.text.split('@')[0],
        'bio': 'Say something about yourself !',
      });
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              const Icon(
                Icons.lock,
                size: 100,
              ),
              //greetings
              const SizedBox(
                height: 25,
              ),
              const Text("Register to get access !"),
              //email
              const SizedBox(
                height: 25,
              ),
              MyTextField(
                controller: emailTextController,
                hintText: "johndoe@email.com",
                obscureText: false,
              ),
              //password
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: passwordTextController,
                hintText: "Password",
                obscureText: true,
              ),

              //Confirm password
              const SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: confirmPasswordTextController,
                hintText: "Confirm Password",
                obscureText: true,
              ),
              //sign up
              const SizedBox(
                height: 25,
              ),
              LoginButton(onTap: signUp, text: 'Sign Up'),
              //Redirect to sign in
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account ? '),
                  const SizedBox(
                    height: 75,
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Log in now',
                      style: TextStyle(
                          color: Colors.blue.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}