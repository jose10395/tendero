import 'package:flutter/material.dart';

/// Remplace for
/// Navigator.push(context, CupertinoPageRoute(builder: (_) => PrincipalPage())

class RightToLeftPageRoute extends PageRouteBuilder {
  final Widget newPage;
  RightToLeftPageRoute({@required this.newPage, int duration = 600})
      : super(
          pageBuilder: (_, animation, ___) => SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: newPage,
          ),
          transitionDuration: Duration(milliseconds: duration),
        );
}

class FadePageRoute extends PageRouteBuilder {
  final Widget newPage;
  FadePageRoute({@required this.newPage, int duration = 600})
      : super(
          pageBuilder: (_, animation, ___) =>
              FadeTransition(opacity: animation, child: newPage),
          transitionDuration: Duration(milliseconds: duration),
        );
}
