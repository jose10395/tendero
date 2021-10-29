import 'dart:convert';

abstract class ApiRespositoryInterface {}

class Resp {
  int status;
  String mensaje;
  dynamic data;

  Resp({this.status, this.mensaje, this.data});

  Resp.fromJson(dynamic dat) {
    final map = json.decode(dat);
    status = map['status'];
    mensaje = map['mensaje'];
    data = map['data'];
  }
}
