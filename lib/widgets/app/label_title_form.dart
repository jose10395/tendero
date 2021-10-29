import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';

class LabelTitleForm extends StatelessWidget {
  const LabelTitleForm(
    this.text, {
    Key key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        color: CColors.blue,
        borderRadius: BorderRadius.circular(40),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    );
  }
}
