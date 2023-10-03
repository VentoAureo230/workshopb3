import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SuperLikeBtn extends StatelessWidget {
  final void Function()? onTap;
  const SuperLikeBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.star_rounded,
        color: BlueColor,
      ),
    );
  }
}
