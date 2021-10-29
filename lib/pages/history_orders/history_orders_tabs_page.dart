import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/provider/provider_page.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/pages/history_orders/history_orders_tabs_block.dart';
import 'package:tiendero/pages/orders_tabs/view_order/view_order_page.dart';
import 'package:tiendero/widgets/app/footer_info.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/layouts/app_bar_back.dart';
import 'package:tiendero/widgets/layouts/drawer_der.dart';

class HistoryOrdersTabsPage extends ProviderPage<HistoryOrdersTabsBloC> {
  @override
  HistoryOrdersTabsBloC onCreate(BuildContext context) {
    return HistoryOrdersTabsBloC();
  }

  @override
  Widget buildPage(BuildContext context, HistoryOrdersTabsBloC bloc) {
    return Scaffold(
      appBar: AppBarBack(
        "HISTORIAL DE ORDENES",
        btnBack: false,
      ),
      endDrawer: DrawerDer(),
      drawerScrimColor: Colors.transparent,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => bloc.changePage(0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: CColors.green, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        "AHORA",
                        style: TextStyle(
                            color: CColors.green, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: InkWell(
                    onTap: () => bloc.changePage(1),
                    child: Container(
                      decoration: BoxDecoration(
                        color: CColors.green,
                        border: Border.all(color: CColors.green, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: Text(
                        "TODAS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              controller: bloc.pageController,
              children: [
                ListView.builder(
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    //ITEM
                    return _ItemOrder();
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    //ITEM
                    return _ItemOrder();
                  },
                ),
              ],
            ),
          ),
          FooterInfo(notStock: 4, pending: 3),
        ],
      ),
    );
  }
}

class _ItemOrder extends StatelessWidget {
  const _ItemOrder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                TextB(
                  "ORDEN: CD-564381",
                  color: CColors.blue,
                  textAlign: TextAlign.center,
                  typeB: TypeB.title,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      CVectors.icon_check,
                      height: 50,
                      matchTextDirection: true,
                    ),
                    SizedBox(width: 7),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextB(
                              "Fecha: ",
                              color: CColors.orange,
                              textAlign: TextAlign.left,
                            ),
                            TextL(
                              "24-05-2021",
                              color: CColors.orange,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextB(
                              "Hora: ",
                              color: CColors.orange,
                              textAlign: TextAlign.left,
                            ),
                            TextL(
                              "5:30 PM",
                              color: CColors.orange,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            TextB(
                              "Total: ",
                              color: CColors.orange,
                              textAlign: TextAlign.left,
                            ),
                            TextL(
                              "\$25.00",
                              color: CColors.orange,
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 2,
            height: 80,
            color: Colors.black,
            margin: EdgeInsets.symmetric(horizontal: 10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FittedBox(
                  child: TextB(
                    "Super banquetazo alitas",
                    textAlign: TextAlign.center,
                    typeB: TypeB.title,
                  ),
                ),
                TextL(
                  "Incluye",
                  textAlign: TextAlign.left,
                ),
                TextL(
                  "-24 alitas a la barbacoa",
                  textAlign: TextAlign.left,
                ),
                TextL(
                  "-24 alitas picante",
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
