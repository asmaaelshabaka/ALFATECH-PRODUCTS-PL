import 'package:flutter/material.dart';

class CustomTxt extends StatelessWidget {
  CustomTxt(@required this.text, @required this.color, @required this.fontSize,@ required this.height,
      @required this.alignment);
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: color,height: height),
      ),
    );
  }
}
