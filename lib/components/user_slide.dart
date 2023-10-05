import 'package:flutter/material.dart';

class UserProfileCard extends StatelessWidget {
  final String image;
  final String fullName;
  final String age;
  final String biography;
  final String experiences;
  final String diplomas;

  const UserProfileCard({
    super.key,
    required this.image,
    required this.fullName,
    required this.age,
    required this.biography,
    required this.experiences,
    required this.diplomas,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(image),
            const SizedBox(height: 8.0),
            Text(
              'Full Name: $fullName',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Age: $age',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Biography: $biography',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Experiences: $experiences',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Diplomas: $diplomas',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
