import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    Key key,
    @required this.assetName,
    @required this.title,
  }) : super(key: key);

  final String assetName;
  final String title;

  @override
  Widget build(BuildContext context) {
    const height = 60.0;
    const padding = 10.0;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(padding),
      alignment: Alignment.center,
      height: height,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetName,
              matchTextDirection: true,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: CColors.green,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
