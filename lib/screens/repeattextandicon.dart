import 'package:flutter/material.dart';

class RepeatTextandIcon extends StatelessWidget {
  final IconData? iconData;
  final String? label;
  RepeatTextandIcon({this.iconData, this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ImageIcon()
        Icon(
          iconData,
          size: 80,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          '$label',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}