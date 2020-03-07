import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calc_mac/models/calculator.dart';
import 'package:calc_mac/pages/calculator_ui.dart';

void main() {
  Color orange = Color.fromRGBO(250, 130, 49, 1.0),
      grey = Color.fromRGBO(240, 240, 240, 1.0);

  return runApp(
    ChangeNotifierProvider<CalculatorModel>(
      builder: (context) => CalculatorModel(),
      child: MaterialApp(
        title: 'calc_mac',
        theme: ThemeData(
          colorScheme: ColorScheme(
              primary: orange,
              primaryVariant: Colors.white,
              onPrimary: orange,
              secondary: grey,
              secondaryVariant: Colors.black,
              onSecondary: grey,
              background: Colors.black,
              onBackground: Colors.black,
              error: Colors.red,
              onError: Colors.red,
              surface: grey,
              onSurface: grey,
              brightness: Brightness.light),
          appBarTheme: AppBarTheme(
              color: orange,
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Colors.white,
                      fontFamily: 'RobotoMono',
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold))),
          fontFamily: 'RobotoMono',
          textTheme: TextTheme(
              body1: TextStyle(color: Colors.black, fontSize: 28.0),
              body2: TextStyle(color: Colors.black, fontSize: 14.0)),
          buttonColor: grey,
          splashColor: orange,
        ),
        home: CalculatorUi(),
      ),
    ),
  );
}
