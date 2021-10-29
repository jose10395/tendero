import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/pages/login/login_page.dart';
import 'package:tiendero/widgets/app/btn_default.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SvgPicture.asset(
              CVectors.header1,
              width: CC(context).width,
              matchTextDirection: true,
            ),
            Spacer(),
            Image.asset(
              CImgs.logo_color,
              width: 280,
            ),
            BtnDefault(
              "Continuar",
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (_) => LoginPage()),
                );
              },
              color: CColors.blue,
            ),
            Spacer(),
            SizedBox(
              height: 50,
              child: FittedBox(
                child: Text(
                  "BIENVENIDA",
                  style: TextStyle(
                    color: CColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              child: FittedBox(
                child: Text(
                  "Empresa afiliada",
                  style: TextStyle(
                    color: CColors.blue,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
