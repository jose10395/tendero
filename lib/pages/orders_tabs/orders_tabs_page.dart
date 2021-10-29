import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/core/provider/provider_page.dart';
import 'package:tiendero/core/routing.dart';
import 'package:tiendero/globals/auth_controller.dart';
import 'package:tiendero/pages/orders_tabs/orders_tabs_block.dart';
import 'package:tiendero/pages/orders_tabs/view_order/view_order_page.dart';
import 'package:tiendero/widgets/app/footer_info.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/app/order/order_process.dart';
import 'package:tiendero/widgets/layouts/app_bar_back.dart';
import 'package:tiendero/widgets/layouts/drawer_der.dart';
import 'package:provider/provider.dart';

class OrdersTabsPage extends ProviderPage<OrdersTabsBloC> {
  @override
  OrdersTabsBloC onCreate(BuildContext context) {
    return OrdersTabsBloC(auth: context.read<AuthController>());
  }

  @override
  Widget buildPage(BuildContext context, OrdersTabsBloC bloc) {
    return Scaffold(
      appBar: AppBarBack(
        "Ordenes",
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
                        "Orden\nNueva",
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
                        "Ordenes es\nPerparacion",
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
                Expanded(
                  flex: 1,
                  child: ValueListenableBuilder(
                    valueListenable: bloc.auth.example,
                    builder: (_, value, child) {
                      return value
                          ? child
                          : Container(
                              color: Colors.white,
                              height: 150,
                              alignment: Alignment.topCenter,
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextL(
                                    '¡No tienes ninguna\norden por el momento!',
                                    textAlign: TextAlign.center,
                                    color: CColors.blue,
                                  ),
                                  SizedBox(height: 10),
                                  Icon(
                                    CupertinoIcons.multiply_circle_fill,
                                    size: 50,
                                    color: CColors.blue,
                                  ),
                                ],
                              ),
                            );
                    },
                    child: ListView.builder(
                      itemCount: 1,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        //ITEM
                        return Container(
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    CVectors.icon_clock,
                                    height: 50,
                                    matchTextDirection: true,
                                  ),
                                  SizedBox(width: 10),
                                  SizedBox(
                                    height: 50,
                                    child: FittedBox(
                                      child: Text(
                                        "02:59",
                                        style: TextStyle(
                                          color: CColors.blue,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              TextL("Tiempo para aceptar la orden"),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextB("ORDEN:"),
                                        TextL("CD-564381"),
                                        SizedBox(height: 5),
                                        TextB("CLIENTE:"),
                                        TextL("Sofia Alexandra Cruz López"),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  //BTN_ordem
                                  Expanded(
                                    flex: 1,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          RightToLeftPageRoute(
                                              newPage: ViewOrderPage()),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: CColors.green,
                                          border: Border.all(
                                              color: CColors.green, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Ver\nOrden",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                ListView.builder(
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int index) {
                    return OrdenProcess(
                      title: 'ORDEN:CD-563481',
                      viewIconClock: true,
                      viewTitleDuration: false,
                      dateTimeInit: DateTime(2021, 6, 16, 21, 50),
                      duration: Duration(minutes: 15),
                      onTap: () {},
                    );
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
