import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ListTileDrawer extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const ListTileDrawer({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: WhiteColor,
      ),
      onTap: onTap,
      title: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}