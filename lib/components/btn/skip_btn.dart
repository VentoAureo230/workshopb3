import 'package:flutter/material.dart';
import '../../theme/colors.dart';

class SkipBtn extends StatelessWidget {
  final void Function()? onTap;
  const SkipBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.block_rounded,
        color: CrimsonColor,
        size: 75,
      ),
    );
  }
}
