import 'package:flutter/material.dart';
import 'package:workshopb3/theme/colors.dart';

class RewindBtn extends StatelessWidget {
  final void Function()? onTap;
  const RewindBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
        ),
        child: const Center(
          child: Icon(
            Icons.autorenew_rounded,
            color: WhiteColor,
            size: 30,
          ),
        ),
      ),
    );
  }
}
