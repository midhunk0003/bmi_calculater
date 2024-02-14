import 'package:flutter/material.dart';

class RepeatedSameContainer extends StatelessWidget {
  final Color? colors;
  final Widget? cardWidget;
  RepeatedSameContainer({this.colors, this.cardWidget});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colors,
      ),
      child: cardWidget,
    );
  }
}
