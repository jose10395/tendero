import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum TypeB { none, title }

class TextB extends StatelessWidget {
  const TextB(
    this.text, {
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
    this.typeB = TypeB.none,
    Key key,
  }) : super(key: key);

  final String text;
  final Color color;
  final TextAlign textAlign;
  final TypeB typeB;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: typeB == TypeB.title ? FontWeight.w800 : FontWeight.bold,
        fontSize: typeB == TypeB.title ? 16 : 14,
      ),
    );
  }
}

class TextL extends StatelessWidget {
  const TextL(
    this.text, {
    this.color = Colors.black,
    this.textAlign = TextAlign.left,
    Key key,
  }) : super(key: key);

  final String text;
  final Color color;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w400,
        fontSize: 13,
      ),
    );
  }
}
