import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String fullName;
  final String age;
  final String biography;
  final String experiences;
  final String diplomas;

  const UserProfileCard({super.key, 
    required this.fullName,
    required this.age,
    required this.biography,
    required this.experiences,
    required this.diplomas,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fullName,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text("Age: $age"),
            Text("Biography: $biography"),
            Text("Experiences: $experiences"),
            Text("Diplomas: $diplomas"),
          ],
        ),
      ),
    );
  }
}

