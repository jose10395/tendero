import 'package:meta/meta.dart' show mustCallSuper;
import 'package:tiendero/core/provider/base_bloc.dart';

abstract class ProviderBloC extends BaseBloC {
  @override
  void onInit() {}

  @override
  void onReady() {}

  @mustCallSuper
  void onDispose() async {
    super.onDispose();
  }
}
