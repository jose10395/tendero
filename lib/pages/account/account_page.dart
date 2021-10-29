import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/provider/provider_page.dart';
import 'package:tiendero/pages/account/account_bloc.dart';
import 'package:tiendero/widgets/app/footer_info.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/layouts/app_bar_back.dart';
import 'package:tiendero/widgets/layouts/drawer_der.dart';

class AccountPage extends ProviderPage<AccountBloC> {
  @override
  AccountBloC onCreate(BuildContext context) {
    return AccountBloC();
  }

  @override
  Widget buildPage(BuildContext context, AccountBloC bloc) {
    return Scaffold(
      appBar: AppBarBack('Cuenta'),
      endDrawer: DrawerDer(),
      drawerScrimColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 280,
                    child: Stack(
                      children: [
                        Image.asset(
                          CImgs.account_header,
                          height: 200,
                          width: CC(context).width,
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          left: (CC(context).width / 2) - 70,
                          top: 130,
                          child: CircleAvatar(
                            radius: 70.0,
                            backgroundImage: NetworkImage(
                                'https://www.womgp.com/blog/wp-content/uploads/2020/03/tienda-online.jpg'),
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        Positioned(
                          top: 205,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextB(
                              "Pollo\nCampero",
                              typeB: TypeB.title,
                              color: CColors.orange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  _InfoAccount(
                    title: 'Cuenta:',
                    text: 'CR-789056',
                  ),
                  _InfoAccount(
                    title: 'Restaurante:',
                    text: 'Pollo Campero',
                  ),
                  _InfoAccount(
                    title: 'Sucursal:',
                    text: 'Alameda Roosevelt',
                  ),
                  _InfoAccount(
                    title: 'Direccion:',
                    text: 'Alameda Roosevelt y 61 Av. Sur, #3134, San Salvador',
                  ),
                  _InfoAccount(
                    title: 'Telefono:',
                    text: '2213-56-78  2213-5779',
                  ),
                  _InfoAccount(
                    title: 'Correo:',
                    text: 'campero34@gmail.com',
                  ),
                  _InfoAccount(
                    title: 'Contraseña:',
                    text: '*********',
                  ),
                ],
              ),
            ),
          ),
          FooterInfo(notStock: 4, pending: 3),
        ],
      ),
    );
  }
}

class _InfoAccount extends StatelessWidget {
  const _InfoAccount({
    Key key,
    @required this.title,
    @required this.text,
  }) : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(20),
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextB(title),
          TextL(text),
        ],
      ),
    );
  }
}
