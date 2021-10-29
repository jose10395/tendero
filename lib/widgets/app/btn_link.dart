import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';

class BtnLink extends StatelessWidget {
  const BtnLink({
    @required this.onPressed,
    @required this.text,
    Key key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(primary: CColors.green),
      child: Text(
        text,
        style: TextStyle(
          color: CColors.green,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
