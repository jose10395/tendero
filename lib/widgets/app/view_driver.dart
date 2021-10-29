import 'package:flutter/material.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/widgets/app/labels.dart';

class ViewDriver extends StatelessWidget {
  const ViewDriver({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(
                'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos-810x540.jpg'),
            backgroundColor: Colors.red,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextB(
                "DRIVER:",
                color: CColors.blue,
                typeB: TypeB.title,
              ),
              TextL(
                "Fernando Guzmán",
                color: CColors.blue,
              ),
              TextB(
                "ID-20045317",
                color: CColors.blue,
              ),
            ],
          )
        ],
      ),
    );
  }
}
