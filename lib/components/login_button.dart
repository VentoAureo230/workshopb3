import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const LoginButton({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: BlackColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: 
          Center(
            child: 
              Text(
                text,
                style: const TextStyle(
                  color: WhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
            )
          ),
        ),
      ),
    );
  }
}