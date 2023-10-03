import 'package:flutter/material.dart';
import '../theme/colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({super.key, required this.controller, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: WhiteColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: WhiteColor),
        ),
        fillColor: GreyColor,
        filled: true,
        hintText: hintText,
      ),
    );
  }
}