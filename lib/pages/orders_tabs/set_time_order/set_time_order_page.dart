import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/pages/orders_tabs/prepare_order/prepare_order_page.dart';
import 'package:tiendero/pages/orders_tabs/set_time_order/tutu.dart';
import 'package:tiendero/widgets/app/btn_default.dart';
import 'package:tiendero/widgets/app/footer_info.dart';
import 'package:tiendero/widgets/app/head_title.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/layouts/alerta.dart';
import 'package:tiendero/widgets/layouts/app_bar_back.dart';
import 'package:tiendero/widgets/layouts/drawer_der.dart';

class SetTimeOrderPage extends StatelessWidget {
  const SetTimeOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(""),
      endDrawer: DrawerDer(),
      drawerScrimColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              HeadTitle(
                assetName: CVectors.icon_clock,
                title: 'Tiempo de preparación',
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: TextB(
                        "ORDEN:CD-563481",
                        color: CColors.blue,
                        typeB: TypeB.title,
                      ),
                    ),
                    RadioGroup(
                      onSelected: (valueCheck, item) {},
                      itemSelect: 0,
                      items: [
                        RadioItem(
                            id: 1,
                            title: "15 Minutos (Tiempo Recomendado)",
                            data: "holis perris"),
                        RadioItem(
                          id: 2,
                          title: "25 Minutos",
                        ),
                        RadioItem(
                          id: 3,
                          title: "35 Minutos",
                        ),
                        RadioItem(
                          id: 4,
                          title: "40 Minutos",
                        ),
                      ],
                    ),
                    BtnDefault("Aceptar Orden", onTap: () async {
                      await Alerta(
                        titulo: '',
                        mensaje: '¡La Orden ha sido ingresa al sistema!',
                      ).show(context);
                      Navigator.push(
                        context,
                        RightToLeftPageRoute(newPage: PrepareOrderPage()),
                      );
                    }),
                    BtnDefault(
                      "Cancelar Orden",
                      onTap: () async {
                        final alert = await Alerta(
                          mensaje: '¿Esta seguro que desea rechazar la orden?',
                          color: CColors.pinkish,
                        ).question(context);

                        if (alert) {
                          Alerta(
                            mensaje: 'Orden ha sido cancelada',
                            color: CColors.pinkish,
                            isCloseIcon: true,
                          ).show(context);
                        }
                        return alert;
                      },
                      color: CColors.pinkish,
                    )
                  ],
                ),
              ),
              FooterInfo(notStock: 4, pending: 3),
            ],
          ),
        ),
      ),
    );
  }
}
