import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tiendero/core/provider/base_bloc.dart';

/// Permite llevar el Bloc como una clase externa al UI y reemplaza al StatelessWidget
///
/// se debe reemplazar el build por  buildPage
///
/// onCreate es necesario para las inyecciones de las dependencias
abstract class ProviderPage<T extends BaseBloC>
    extends SingleChildStatelessWidget {
  T onCreate(BuildContext context);
  Widget buildPage(BuildContext context, T bloc);

  ProviderPage({Key key}) : super(key: key);

  void onInit(BuildContext context, T bloc) {}
  void onReady(BuildContext context, T bloc) {}
  void onDispose(BuildContext context, T bloc) {}

  @override
  Widget buildWithChild(BuildContext context, Widget child) {
    return InheritedProvider<T>(
      create: this.onCreate,
      dispose: (context, bloc) {
        bloc.onDispose();
        if (this.onDispose != null) this.onDispose(context, bloc);
      },
      startListening: (e, bloc) {
        bloc.onInit();
        if (this.onInit != null) this.onInit(e, bloc);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!bloc.disposed) {
            bloc.onReady();
            if (this.onReady != null) this.onReady(e, bloc);
          }
        });
        return () {};
      },
      child: child,
      lazy: false,
      updateShouldNotify: (_, __) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return this.buildWithChild(
      context,
      Builder(
        builder: (context) {
          return this.buildPage(
            context,
            Provider.of<T>(context, listen: true),
          );
        },
      ),
    );
  }
}
