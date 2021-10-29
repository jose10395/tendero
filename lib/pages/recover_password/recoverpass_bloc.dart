import 'package:flutter/cupertino.dart';
import 'package:tiendero/core/provider/provider_bloc.dart';

class RecoverPassBloc extends ProviderBloC {
  ValueNotifier<bool> showPass1 = ValueNotifier<bool>(false);
  ValueNotifier<bool> showPass2 = ValueNotifier<bool>(false);
}
