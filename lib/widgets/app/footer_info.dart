import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';

class FooterInfo extends StatelessWidget {
  const FooterInfo({
    Key key,
    this.pending = 0,
    this.notStock = 0,
  }) : super(key: key);

  final int notStock;
  final int pending;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      color: CColors.blue,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: CColors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              child: Text(
                'PRODUCTOS\nSIN STOCK $notStock',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.symmetric(vertical: 5),
              alignment: Alignment.center,
              child: Text(
                'ORDENES\nPENDIENTES $pending',
                style: const TextStyle(
                  color: CColors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
