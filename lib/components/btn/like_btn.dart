import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class LikeBtn extends StatelessWidget {
  final void Function()? onTap;
  const LikeBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          height: 65,
          width: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AquaColor,
          ),
          child: const Center(
            child: Icon(
              Icons.favorite_rounded,
              color: WhiteColor,
              size: 50,
            ),
          ),
        ));
  }
}
