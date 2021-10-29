import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';

class BtnDefault extends StatelessWidget {
  const BtnDefault(
    this.text, {
    Key key,
    @required this.onTap,
    this.color = CColors.green,
  }) : super(key: key);

  final String text;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      margin: const EdgeInsets.all(5),
      child: CupertinoButton(
        onPressed: onTap,
        alignment: Alignment.center,
        borderRadius: BorderRadius.circular(50),
        color: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        minSize: 40,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          softWrap: true,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
