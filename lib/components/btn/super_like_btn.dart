import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SuperLikeBtn extends StatelessWidget {
  final void Function()? onTap;
  const SuperLikeBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: BlueColor,
        ),
        child: const Center(
          child: Icon(
            Icons.stars_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
