import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/widgets/app/btn_default.dart';
import 'package:tiendero/widgets/app/labels.dart';
import 'package:tiendero/widgets/app/order/order_timer.dart';

class OrdenProcess extends StatelessWidget {
  const OrdenProcess({
    Key key,
    this.viewTitle = true,
    this.viewIconClock = false,
    this.viewTitleDuration = true,
    this.title,
    this.dateTimeInit,
    this.duration,
    this.onTap,
    this.marginBottom = 8,
  }) : super(key: key);

  final bool viewTitle;
  final bool viewTitleDuration;
  final bool viewIconClock;
  final String title;
  final DateTime dateTimeInit;
  final Duration duration;
  final VoidCallback onTap;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: marginBottom),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          (viewTitle && title != null)
              ? Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextB(
                    title,
                    color: CColors.blue,
                    typeB: TypeB.title,
                  ),
                )
              : const SizedBox.shrink(),
          OrderTimer(
            viewTitleDuration: viewTitleDuration,
            dateTimeInit: dateTimeInit,
            durationOrder: duration,
          ),
          viewIconClock
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SvgPicture.asset(
                    CVectors.icon_clock,
                    matchTextDirection: true,
                  ),
                )
              : const SizedBox.shrink(),
          onTap == null
              ? const SizedBox.shrink()
              : BtnDefault(
                  "Orden en preparación",
                  onTap: onTap,
                ),
        ],
      ),
    );
  }
}
