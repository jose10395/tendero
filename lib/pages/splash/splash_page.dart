import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/provider/base_bloc.dart';
import 'package:tiendero/core/provider/provider_page.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/pages/orders_tabs/orders_tabs_page.dart';
import 'package:tiendero/pages/splash/splash_bloc.dart';

class SplashPage extends ProviderPage {
  @override
  BaseBloC onCreate(BuildContext context) {
    return SplashBloC();
  }

  @override
  void onReady(BuildContext context, BaseBloC bloc) async {
    // Future.delayed(Duration(milliseconds: 2000), () {
    Navigator.of(context).push(FadePageRoute(newPage: OrdersTabsPage()));
    // });
    super.onReady(context, bloc);
  }

  @override
  Widget buildPage(BuildContext context, BaseBloC bloc) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: SvgPicture.asset(
                CVectors.background,
                matchTextDirection: true,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(CImgs.logo_blanco),
              ),
            ),
            Positioned(
              bottom: (CC(context).height * 0.25),
              left: (CC(context).width / 2) - 25,
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  backgroundColor: CColors.yellow,
                  strokeWidth: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
