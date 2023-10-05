import 'package:flutter/material.dart';

class ToggleBtn extends StatefulWidget {
const ToggleBtn({Key? key}) : super(key: key);

  @override
  State<ToggleBtn> createState() => ToggleBtnState();
}

class ToggleBtnState extends State<ToggleBtn> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Are you searching for a match ?"),
        Switch(
          value: light,
          activeColor: Colors.green,
          inactiveThumbColor: Colors.red,
          onChanged: (bool value) {
            setState(() {
              light = value;
            });
          },
        ),
      ],
    );
  }
}
