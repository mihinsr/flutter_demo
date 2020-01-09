import 'package:bloc_provider_demo/Bloc/FormBloc.dart';
import 'package:bloc_provider_demo/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Constants.AppColorCode));
    MaterialColor colorCustom = MaterialColor(0xFF153EFB, color);

    return ChangeNotifierProvider<FormBloc>(
      builder: (context) => FormBloc(),
    child: MaterialApp(
      theme: new ThemeData(
        primarySwatch: colorCustom,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
    ));
  }
}