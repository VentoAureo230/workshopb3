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
          height: 45,
          width: 45,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: BlueColor),
          child: const Center(
            child: Icon(
              Icons.star_rounded,
              color: WhiteColor,
              size: 30,
            ),
          ),
        ));
  }
}
