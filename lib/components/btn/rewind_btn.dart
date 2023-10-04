import 'package:flutter/material.dart';

class RewindBtn extends StatelessWidget {
  final void Function()? onTap;
  const RewindBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50, // Ajustez la largeur et la hauteur selon vos besoins
        height: 50,
        decoration: const BoxDecoration(
          shape: BoxShape.circle, // Définit la forme comme circulaire
          color: Colors.orange, // Couleur de l'arrière-plan du bouton
        ),
        child: const Center(
          child: Icon(
            Icons.autorenew_rounded,
            color: Colors.white, // Couleur de l'icône
            size: 30, // Ajustez la taille de l'icône selon vos besoins
          ),
        ),
      ),
    );
  }
}
