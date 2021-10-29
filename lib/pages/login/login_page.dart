import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/provider/provider_page.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/pages/login/login_bloc.dart';
import 'package:tiendero/pages/orders_tabs/orders_tabs_page.dart';
import 'package:tiendero/pages/recover_password/recoverpass_page.dart';
import 'package:tiendero/widgets/app/btn_link.dart';
import 'package:tiendero/widgets/app/label_title_form.dart';
import 'package:tiendero/widgets/app/textbox.dart';
import 'package:tiendero/widgets/layouts/app_bar1.dart';

class LoginPage extends ProviderPage<LoginBloC> {
  @override
  LoginBloC onCreate(BuildContext context) {
    return LoginBloC();
  }

  @override
  Widget buildPage(BuildContext context, LoginBloC bloc) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                width: CC(context).width,
                height: CC(context).height,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: AppBar1(title: 'INGRESAR DATOS'),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const LabelTitleForm("Correo:"),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Textbox(
                                    placeholder: 'Tu correo electronico',
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                const LabelTitleForm("Contraseña:"),
                                SizedBox(width: 10),
                                Expanded(
                                  child: ValueListenableBuilder(
                                    valueListenable: bloc.showPass,
                                    builder: (_, bool value, __) {
                                      return Textbox(
                                        placeholder: 'Tu clave secreta',
                                        isPassword: true,
                                        showPassword: value,
                                        onTapIconPassword: () {
                                          bloc.showPass.value =
                                              !bloc.showPass.value;
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: BtnLink(
                          onPressed: () {
                            Navigator.of(context).push(
                              RightToLeftPageRoute(newPage: RecoverPassPage()),
                            );
                          },
                          text: 'Olvide mi contraseña',
                        ),
                      ),
                    ),
                    Spacer(),
                    CupertinoButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          RightToLeftPageRoute(newPage: OrdersTabsPage()),
                        );
                      },
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(50),
                      color: CColors.green,
                      child: Text(
                        "Continuar",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: BtnLink(
                        onPressed: () {},
                        text: 'Necesito ayuda',
                      ),
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            SvgPicture.asset(
              CVectors.header2,
              width: CC(context).width,
              matchTextDirection: true,
            ),
          ],
        ),
      ),
    );
  }
}
