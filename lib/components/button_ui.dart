import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calc_mac/models/calculator.dart';

typedef CalculatorController = void Function(CalculatorModel calc_mac);

class Button extends StatelessWidget {
  Button({
    Key key,
    this.child,
    this.operation,
    this.fillColor,
    this.splashColor,
  }) : super(key: key);

  final CalculatorController operation;
  final Color fillColor, splashColor;
  final Widget child;

  @override
  Widget build(BuildContext context) => RawMaterialButton(
        onPressed: () => operation(Provider.of<CalculatorModel>(context)),
        fillColor: fillColor,
        splashColor: splashColor,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
                right:
                    BorderSide(width: 0.5, color: Color.fromRGBO(8, 8, 8, 1.0)),
                bottom: BorderSide(
                    width: 0.5, color: Color.fromRGBO(8, 8, 8, 1.0))),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      );
}
