import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/globals/auth_controller.dart';
import 'package:tiendero/pages/account/account_page.dart';
import 'package:tiendero/pages/history_orders/history_orders_tabs_page.dart';
import 'package:tiendero/pages/terminos/terminos_page.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:provider/provider.dart';

class DrawerDer extends StatefulWidget {
  const DrawerDer({Key key}) : super(key: key);

  @override
  _DrawerDerState createState() => _DrawerDerState();
}

class _DrawerDerState extends State<DrawerDer> {
  ValueNotifier<bool> disponible = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: CColors.background,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight - 1),
          child: Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: CC(context).width * 0.60,
              height: CC(context).height * 0.70,
              child: Drawer(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //image
                      CircleAvatar(
                        radius: 75.0,
                        backgroundImage: NetworkImage(
                            'https://www.womgp.com/blog/wp-content/uploads/2020/03/tienda-online.jpg'),
                        backgroundColor: Colors.grey,
                      ),
                      //toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Transform.scale(
                            scale: 1.5,
                            child: ValueListenableBuilder(
                              valueListenable: disponible,
                              builder: (_, value, __) {
                                return Switch(
                                  //drag
                                  overlayColor:
                                      MaterialStateProperty.all(CColors.blue),
                                  trackColor:
                                      MaterialStateProperty.all(Colors.grey),
                                  //active
                                  activeColor: CColors.green,
                                  //inactive
                                  inactiveThumbColor: CColors.pinkish,
                                  splashRadius: 20,
                                  value: value,
                                  onChanged: (bool value) {
                                    disponible.value = value;
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          TextL('No disponible', color: CColors.blue),
                        ],
                      ),
                      //items
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _ItemMenu(
                            assetName: CVectors.icon_user,
                            title: 'Cuenta',
                            onTap: () {
                              Navigator.push(
                                context,
                                RightToLeftPageRoute(
                                  newPage: AccountPage(),
                                ),
                              );
                            },
                          ),
                          _ItemMenu(
                            assetName: CVectors.icon_orders,
                            title: 'Ordenes',
                            onTap: () {
                              final auth = context.read<AuthController>();
                              auth.example.value = true;

                              Navigator.pop(context);
                            },
                          ),
                          _ItemMenu(
                            assetName: CVectors.icon_history,
                            title: 'Historial de Ordenes',
                            onTap: () {
                              Navigator.push(
                                context,
                                RightToLeftPageRoute(
                                  newPage: HistoryOrdersTabsPage(),
                                ),
                              );
                            },
                          ),
                          _ItemMenu(
                            assetName: CVectors.icon_products_stock,
                            title: 'Productos en Stock',
                            onTap: () {},
                          ),
                          _ItemMenu(
                            assetName: CVectors.icon_terminos,
                            title: 'Términos y condiciones',
                            onTap: () {
                              Navigator.push(
                                context,
                                RightToLeftPageRoute(
                                  newPage: TerminosPage(),
                                ),
                              );
                            },
                          ),
                          _ItemMenu(
                            assetName: CVectors.icon_faqs,
                            title: 'FAQS',
                            onTap: () {},
                          ),
                          _ItemMenu(
                            assetName: CVectors.icon_logout,
                            title: 'Cerrar Sesión',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemMenu extends StatelessWidget {
  const _ItemMenu({
    Key key,
    this.onTap,
    @required this.title,
    @required this.assetName,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SvgPicture.asset(assetName, matchTextDirection: true),
            const SizedBox(width: 7),
            TextL(title, color: CColors.blue),
          ],
        ),
      ),
    );
  }
}
