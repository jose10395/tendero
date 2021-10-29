import 'package:flutter/material.dart';
import 'package:tiendero/core/provider/provider_bloc.dart';
import 'package:tiendero/globals/auth_controller.dart';

class OrdersTabsBloC extends ProviderBloC {
  OrdersTabsBloC({this.auth});
  final AuthController auth;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void changePage(int index) {
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
