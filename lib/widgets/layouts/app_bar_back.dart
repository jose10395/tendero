import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool btnBack;

  const AppBarBack(this.title, {Key key, this.btnBack})
      : preferredSize = const Size.fromHeight(55.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CColors.blue,
      elevation: 1,
      automaticallyImplyLeading: false,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      leading: btnBack == null
          ? IconButton(
              icon: const Icon(
                //CupertinoIcons.arrow_counterclockwise_circle_fill
                CupertinoIcons.arrow_left_circle_fill,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : btnBack == false
              ? null
              : IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: CColors.green,
                    size: 35,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
    );
  }
}
