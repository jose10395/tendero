import 'package:flutter/widgets.dart';
import 'package:tiendero/core/provider/provider_bloc.dart';

class LoginBloC extends ProviderBloC {
  ValueNotifier<bool> showPass = ValueNotifier<bool>(false);
}
