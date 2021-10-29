import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';

class AppBar1 extends StatelessWidget {
  const AppBar1({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: SvgPicture.asset(
              CVectors.btn_back1,
              width: 35,
              height: 35,
              matchTextDirection: true,
            ),
          ),
          SizedBox(width: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                height: 35,
                child: FittedBox(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: CColors.blue,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
