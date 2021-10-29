import 'package:flutter/material.dart';

class CC {
  double width = 0;
  double height = 0;
  CC(BuildContext context) {
    this.width = MediaQuery.of(context).size.width;
    this.height = MediaQuery.of(context).size.height;
  }
}

class CImgs {
  const CImgs();

  static const String logo_color = 'assets/images/imgs/logo_color.png';
  static const String logo_blanco = 'assets/images/imgs/logo_blanco.png';
  static const String account_header = 'assets/images/imgs/account_header.png';
}

class CVectors {
  const CVectors();
  static const String background =
      'assets/images/vectors/icono_layout_login.svg';
  static const String header1 = 'assets/images/vectors/header1.svg';
  static const String header2 = 'assets/images/vectors/header2.svg';
  static const String btn_back1 = 'assets/images/vectors/btn_back1.svg';
  static const String icon_clock = 'assets/images/vectors/icon_clock.svg';
  static const String icon_eye = 'assets/images/vectors/icon_eye.svg';
//icons menu
  static const String icon_user = 'assets/images/vectors/icon_user.svg';
  static const String icon_orders = 'assets/images/vectors/icon_orders.svg';
  static const String icon_history = 'assets/images/vectors/icon_history.svg';
  static const String icon_products_stock =
      'assets/images/vectors/icon_products_stock.svg';
  static const String icon_terminos = 'assets/images/vectors/icon_terminos.svg';
  static const String icon_faqs = 'assets/images/vectors/icon_faqs.svg';
  static const String icon_logout = 'assets/images/vectors/icon_logout.svg';
  static const String icon_check = 'assets/images/vectors/icon_check.svg';
}

class CColors {
  const CColors();
  static const Color background = Color(0xFFE5E5E5);
  static const Color green = Color(0xFF3CAA34);
  static const Color blue = Color(0xFF263377);
  static const Color orange = Color(0xFFFFA100);
  static const Color purple = Color(0xFFAB00FF);
  static const Color pinkish = Color(0xFFFF35BD);
  static const Color yellow = Color(0xFFF9E212);
  static const Color grey = Color(0xFFC4C4C4);
  static Color greyLigth = const Color(0xFFEAEAEA).withOpacity(0.88);
}

class CFonts {
  const CFonts();
  static const String montserrat = 'Montserrat';
}

class CTextStyle {
  const CTextStyle();

  static const TextStyle linkButton = TextStyle();
}
