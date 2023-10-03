import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class LikeBtn extends StatelessWidget {
  final void Function()? onTap;
  const LikeBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.favorite_rounded,
        color: AquaColor,
        size: 75,
      ),
    );
  }
}
