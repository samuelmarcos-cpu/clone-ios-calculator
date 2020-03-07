import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:calc_mac/models/calculator.dart';

class Display extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double lineHeight = 55;
    final double lineHeightOperandB = 325;
    int maxLines;
    double height = 0;

    for (maxLines = 0;
        height < MediaQuery.of(context).size.height - lineHeightOperandB;
        maxLines++) {
      height += lineHeight;
    }

    return Container(
        height: 100.0,
        color: Color.fromRGBO(0, 0, 0, 0.4),
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        alignment: AlignmentDirectional.bottomEnd,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Consumer<CalculatorModel>(
              builder: (context, calculator, child) {
                return Text(
                  '${calculator.equation}',
                  key: Key('equation'),
                  textAlign: TextAlign.left,
                  maxLines: maxLines,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                );
              },
            ),
            Consumer<CalculatorModel>(
              builder: (context, calculator, child) {
                return Text(
                  '${calculator.display}',
                  key: Key('operand'),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: TextStyle(fontSize: 26.0, color: Colors.white),
                );
              },
            ),
          ],
        ));
  }
}
