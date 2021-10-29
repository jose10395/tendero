import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/pages/orders_tabs/set_time_order/set_time_order_page.dart';
import 'package:tiendero/widgets/app/btn_default.dart';
import 'package:tiendero/widgets/app/footer_info.dart';
import 'package:tiendero/widgets/app/head_title.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/app/order/order_process.dart';
import 'package:tiendero/widgets/app/view_driver.dart';
import 'package:tiendero/widgets/layouts/alerta.dart';
import 'package:tiendero/widgets/layouts/app_bar_back.dart';
import 'package:tiendero/widgets/layouts/drawer_der.dart';

class ViewOrderPage extends StatelessWidget {
  const ViewOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(""),
      endDrawer: DrawerDer(),
      drawerScrimColor: Colors.transparent,
      body: Column(
        children: [
          // HeadTitle(
          //   assetName: CVectors.icon_eye,
          //   title: 'Ver Orden',
          // ),

          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OrdenProcess(
                    title: 'ORDEN:CD-563481',
                    dateTimeInit: DateTime(2021, 6, 16, 21, 50),
                    duration: Duration(minutes: 15),
                    marginBottom: 0.0,
                  ),
                  ViewDriver(),
                  SizedBox(height: 10),
                  TextB("Cliente:"),
                  TextL("Sofia Alexandra Cruz López"),
                  SizedBox(height: 10),
                  TextB("Incluye:"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextL("-24 alitas a la barbacoa"),
                      TextL("-24 alitas picante"),
                      TextL("-4 aderezos(Mostaza, Ranch, Barbacoa, ajo)"),
                      TextL("-zanahoria y Apio"),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TextB("Acompañante")),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: TextB("Unidades"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TextL("Papas")),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: TextL("1"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TextL("Jugos")),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: TextL("10"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TextB("Extras")),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: TextB("Unidades"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TextL("Pan")),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: TextL("1"),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(child: TextL("Ensalada de repollo")),
                            SizedBox(
                              width: 100,
                              child: Center(
                                child: TextL("10"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(child: TextB("Total:")),
                        SizedBox(
                          width: 100,
                          child: Center(
                            child: TextB("\$25.00"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 100.0,
                        minWidth: CC(context).width,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: CColors.blue, width: 1),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Comentario",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Align(
                  //   child: BtnDefault("Aceptar Orden", onTap: () async {
                  //     await Alerta(
                  //       titulo: '',
                  //       mensaje: '¡La Orden ha sido ingresa al sistema!',
                  //     ).show(context);
                  //     Navigator.push(
                  //       context,
                  //       RightToLeftPageRoute(newPage: SetTimeOrderPage()),
                  //     );
                  //   }),
                  // ),
                  // Align(
                  //   child: BtnDefault(
                  //     "Despachar Orden",
                  //     onTap: () async {
                  //       final alert = await Alerta(
                  //         mensaje: '¿Esta seguro que desea rechazar la orden?',
                  //         color: CColors.pinkish,
                  //       ).question(context);

                  //       if (alert) {
                  //         Alerta(
                  //           mensaje: 'Orden ha sido rechazada',
                  //           color: CColors.pinkish,
                  //           isCloseIcon: true,
                  //         ).show(context);
                  //       }
                  //       return alert;
                  //     },
                  //     color: CColors.orange,
                  //   ),
                  // ),

                  Align(
                    child: BtnDefault(
                      "Despachar Orden",
                      onTap: () async {
                        final alert = await Alerta(
                          mensaje: 'Su orden ha sido despachada con exito',
                          color: CColors.pinkish,
                        ).show(context);

                        // if (alert) {
                        //   Alerta(
                        //     mensaje: 'Orden ha sido rechazada',
                        //     color: CColors.pinkish,
                        //     isCloseIcon: true,
                        //   ).show(context);
                        // }
                        // return alert;
                      },
                      color: CColors.orange,
                    ),
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
