import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tiendero/core/cc.dart';
import 'package:tiendero/globals/auth_controller.dart';
import 'package:tiendero/pages/splash/splash_page.dart';
import 'package:tiendero/repository/api_repository_interface.dart';
import 'package:tiendero/services/services_api_rest.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiRespositoryInterface>(create: (_) => ServicesApiRest()),
        Provider<AuthController>(create: (_) => AuthController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CColors.blue,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      showPerformanceOverlay: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        accentColorBrightness: Brightness.light,
        primaryColorBrightness: Brightness.light,
        //CAMBIAR EL COLOR DEL EFECTO EN LOS LISTVIEW Y PROGRESSBAR
        accentColor: CColors.green,
        //COLOR DE FONDO DE LA APP
        canvasColor: CColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: CFonts.montserrat,
      ),
      home: SplashPage(),
    );
  }
}
