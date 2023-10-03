import 'package:flutter/material.dart';

class RewindBtn extends StatelessWidget {
  final void Function()? onTap;
  const RewindBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(Icons.autorenew_rounded, color: Colors.orange,),
    );
  }
}
