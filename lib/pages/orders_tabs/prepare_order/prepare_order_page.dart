import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/widgets/app/btn_default.dart';
import 'package:tiendero/widgets/app/footer_info.dart';
import 'package:tiendero/widgets/app/head_title.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/app/order/order_process.dart';
import 'package:tiendero/widgets/app/order/order_timer.dart';
import 'package:tiendero/widgets/layouts/app_bar_back.dart';
import 'package:tiendero/widgets/layouts/drawer_der.dart';

class PrepareOrderPage extends StatelessWidget {
  const PrepareOrderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(''),
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
                    OrdenProcess(
                      title: 'ORDEN:CD-563481',
                      viewIconClock: true,
                      dateTimeInit: DateTime(2021, 6, 16, 21, 50),
                      duration: Duration(minutes: 15),
                      onTap: () {},
                    ),
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
