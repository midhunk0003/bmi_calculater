import 'package:flutter/material.dart';

class RoundIcon extends StatelessWidget {
  final IconData iconData;
  final void Function() onPress;
  RoundIcon({required this.iconData, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(iconData),
      elevation: 6.0,
      constraints: BoxConstraints(
        minHeight: 56.0,
        minWidth: 56.0,
      ).tighten(),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
