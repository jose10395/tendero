import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tiendero/core/cc.dart';

class Alerta {
  VoidCallback ontapOK;
  VoidCallback ontapYES;
  VoidCallback ontapNO;
  Color color;
  bool isCloseIcon;

  String titulo;
  String mensaje;

  Alerta({
    this.titulo,
    @required this.mensaje,
    this.ontapOK,
    this.ontapYES,
    this.ontapNO,
    this.color = CColors.green,
    this.isCloseIcon = false,
  });

  Future<bool> question(BuildContext context) async {
    bool resp;
    return await Alert(
      style: AlertStyle(
        isCloseButton: false,
        alertAlignment: Alignment.center,
        animationType: AnimationType.grow,
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: color,
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          // side: const BorderSide(color: CColors.green, width: 3.0),
        ),
        titleStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        descStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
      context: context,
      title: titulo ?? '',
      desc: mensaje,
      buttons: [
        DialogButton(
          child: const Text(
            'NO',
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: ontapNO == null
              ? () {
                  resp = false;
                  Navigator.of(context).pop();
                }
              : ontapNO,
          color: color,
          radius: BorderRadius.circular(10.0),
        ),
        DialogButton(
          child: const Text(
            'SI',
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed: ontapYES == null
              ? () {
                  resp = true;
                  Navigator.of(context).pop();
                }
              : ontapYES,
          color: color,
          radius: BorderRadius.circular(10.0),
        ),
      ],
    ).show().then((value) => resp ?? false);
  }

  Future<bool> show(BuildContext context) async {
    return await Alert(
      onWillPopActive: true,
      style: AlertStyle(
        overlayColor: CColors.blue.withOpacity(0.65),
        backgroundColor: color,
        alertElevation: 0.0,
        isOverlayTapDismiss: false,
        isCloseButton: false,
        alertAlignment: Alignment.center,
        animationType: AnimationType.grow,
        animationDuration: const Duration(milliseconds: 500),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          // side: BorderSide(color: CColors.greyLigth, width: 3.0),
        ),
        titleStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        descStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
      ),
      context: context,
      title: titulo ?? '',
      desc: isCloseIcon ? '' : mensaje,
      content: !isCloseIcon
          ? SizedBox.shrink()
          : Row(
              children: [
                Icon(
                  CupertinoIcons.multiply_circle_fill,
                  size: 50,
                  color: CColors.blue,
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      mensaje,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
      buttons: [
        DialogButton(
          child: const Text(
            'OK',
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          onPressed:
              ontapOK == null ? () => Navigator.of(context).pop() : ontapOK,
          color: color,
          radius: const BorderRadius.all(Radius.circular(10)),
          splashColor: Colors.white.withOpacity(0.50),
          highlightColor: Colors.white.withOpacity(0.50),
        ),
      ],
    ).show().then((value) => true);
  }
}
