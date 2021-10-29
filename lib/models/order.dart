import 'package:tiendero/models/client.dart';
import 'package:tiendero/models/driver.dart';

class Order {
  Order({
    this.key,
    this.duration = const Duration(),
    this.dateTimeInit,
    this.client,
    this.driver,
  });

  String key;
  DateTime dateTimeInit;
  Duration duration;
  Client client;
  Driver driver;
}
