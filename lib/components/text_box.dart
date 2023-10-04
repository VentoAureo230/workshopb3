import 'package:flutter/material.dart';
import '../theme/colors.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  final void Function()? onPressed;
  const TextBox({super.key, required this.text, required this.sectionName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: WhiteColor
        ),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.only(left: 15),
      child : Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(sectionName, style: const TextStyle(fontSize: 14, color: BlueColor),),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              IconButton(onPressed: onPressed, icon: const Icon(Icons.edit_rounded))
            ],
          )
        ],
      )
    );
  }
}