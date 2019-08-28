import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calc_mac/classes/operators.dart';
import 'package:calc_mac/models/calculator.dart';
import 'package:calc_mac/components/display_ui.dart';
import 'package:calc_mac/components/button_ui.dart';
import 'package:calc_mac/pages/calculator_history_ui.dart';

class GridButtons extends StatelessWidget {
  final Operator _plus = Plus(),
      _minus = Minus(),
      _multiplied = Multiplied(),
      _divided = Divided(),
      _reciprocal = Reciprocal(),
      _squared = Squared(),
      _squareRoot = SquareRoot(),
      _percentage = Percentage(),
      _plusMinus = PlusMinus();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final height = screenSize.height * 10 / 100;

    // numbers
    final Widget zero = Container(
      height: height,
      child: Button(
          key: Key('zero'),
          operation: (CalculatorModel calculator) => calculator.zero(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '0',
          )),
    ),
        one = Container(
      height: height,
      child: Button(
          key: Key('one'),
          operation: (CalculatorModel calculator) => calculator.one(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '1',
          )),
    ),
        two = Container(
      height: height,
      child: Button(
          key: Key('two'),
          operation: (CalculatorModel calculator) => calculator.two(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '2',
          )),
    ),
        three = Container(
      height: height,
      child: Button(
          key: Key('three'),
          operation: (CalculatorModel calculator) => calculator.three(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '3',
          )),
    ),
        four = Container(
      height: height,
      child: Button(
          key: Key('four'),
          operation: (CalculatorModel calculator) => calculator.four(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '4',
          )),
    ),
        five = Container(
      height: height,
      child: Button(
          key: Key('five'),
          operation: (CalculatorModel calculator) => calculator.five(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '5',
          )),
    ),
        six = Container(
      height: height,
      child: Button(
          key: Key('six'),
          operation: (CalculatorModel calculator) => calculator.six(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '6',
          )),
    ),
        seven = Container(
      height: height,
      child: Button(
          key: Key('seven'),
          operation: (CalculatorModel calculator) => calculator.seven(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '7',
          )),
    ),
        eigth = Container(
      height: height,
      child: Button(
          key: Key('eight'),
          operation: (CalculatorModel calculator) => calculator.eight(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '8',
          )),
    ),
        nine = Container(
      height: height,
      child: Button(
          key: Key('nine'),
          operation: (CalculatorModel calculator) => calculator.nine(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            '9',
          )),
    ),
        comma = Container(
      height: height,
      child: Button(
          key: Key('comma'),
          operation: (CalculatorModel calculator) => calculator.comma(),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            ',',
          )),
    );

    //Operators
    final Widget plus = Container(
      height: height,
      child: Button(
          key: Key('plus'),
          operation: (CalculatorModel calculator) =>
              calculator.operationBinary(_plus),
          fillColor: Theme.of(context).splashColor,
          splashColor: Theme.of(context).buttonColor,
          child: Text(
            _plus.buttonLabel,
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant),
          )),
    ),
        minus = Container(
      height: height,
      child: Button(
          key: Key('minus'),
          operation: (CalculatorModel calculator) =>
              calculator.operationBinary(_minus),
          fillColor: Theme.of(context).splashColor,
          splashColor: Theme.of(context).buttonColor,
          child: Text(
            _minus.buttonLabel,
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant),
          )),
    ),
        mult = Container(
      height: height,
      child: Button(
          key: Key('multiplied'),
          operation: (calculator) => calculator.operationBinary(_multiplied),
          fillColor: Theme.of(context).splashColor,
          splashColor: Theme.of(context).buttonColor,
          child: Text(
            _multiplied.buttonLabel,
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant),
          )),
    ),
        div = Container(
      height: height,
      child: Button(
          key: Key('divided'),
          operation: (CalculatorModel calculator) =>
              calculator.operationBinary(_divided),
          fillColor: Theme.of(context).splashColor,
          splashColor: Theme.of(context).buttonColor,
          child: Text(
            _divided.buttonLabel,
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant),
          )),
    ),
        backspace = Container(
      height: height,
      child: Button(
        key: Key('backspace'),
        operation: (CalculatorModel calculator) => calculator.backspace(),
        fillColor: Theme.of(context).splashColor,
        splashColor: Theme.of(context).buttonColor,
        child: Icon(
          Icons.backspace,
          color: Theme.of(context).colorScheme.primaryVariant,
        ),
      ),
    ),
        plusMinus = Container(
      height: height,
      child: Button(
          key: Key('plus_minus'),
          operation: (CalculatorModel calculator) =>
              calculator.operationUnaryAsOperand(_plusMinus),
          fillColor: Theme.of(context).buttonColor,
          splashColor: Theme.of(context).splashColor,
          child: Text(
            _plusMinus.buttonLabel,
          )),
    ),
        equals = Container(
      height: height,
      child: Button(
          key: Key('equal'),
          operation: (CalculatorModel calculator) => calculator.equal(),
          fillColor: Theme.of(context).splashColor,
          splashColor: Theme.of(context).buttonColor,
          child: Text(
            '=',
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant),
          )),
    );

    // Settings
    final Widget clear = Container(
      height: height,
      child: Button(
        key: Key('clear'),
        operation: (CalculatorModel calculator) => calculator.clear(),
        fillColor: Theme.of(context).splashColor,
        splashColor: Theme.of(context).buttonColor,
        child: Text('CE',
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant)),
      ),
    ),
        restart = Container(
      height: height,
      child: Button(
        key: Key('restart'),
        operation: (CalculatorModel calculator) => calculator.restart(),
        fillColor: Theme.of(context).splashColor,
        splashColor: Theme.of(context).buttonColor,
        child: Text('C',
            style: Theme.of(context)
                .textTheme
                .body1
                .apply(color: Theme.of(context).colorScheme.primaryVariant)),
      ),
    );

    Table table;
    if (screenSize.width > 500) {
      table = Table(
        children: [
          TableRow(children: [
            Container(
              height: height,
              child: Button(
                  operation: (CalculatorModel calculator) =>
                      calculator.operationUnary(_reciprocal),
                  fillColor: Theme.of(context).buttonColor,
                  splashColor: Theme.of(context).splashColor,
                  child: Text(_reciprocal.buttonLabel,
                      style: Theme.of(context).textTheme.body1)),
            ),
            seven,
            eigth,
            nine,
            div,
            clear,
          ]),
          TableRow(children: [
            Container(
              height: height,
              child: Button(
                  operation: (CalculatorModel calculator) =>
                      calculator.operationUnary(_squared),
                  fillColor: Theme.of(context).buttonColor,
                  splashColor: Theme.of(context).splashColor,
                  child: Text('x' + _squared.buttonLabel,
                      style: Theme.of(context).textTheme.body1)),
            ),
            four,
            five,
            six,
            mult,
            restart,
          ]),
          TableRow(children: [
            Container(
              height: height,
              child: Button(
                  operation: (CalculatorModel calculator) =>
                      calculator.operationUnary(_squareRoot),
                  fillColor: Theme.of(context).buttonColor,
                  splashColor: Theme.of(context).splashColor,
                  child: Text(_squareRoot.buttonLabel,
                      style: Theme.of(context).textTheme.body1)),
            ),
            one,
            two,
            three,
            minus,
            backspace,
          ]),
          TableRow(children: [
            Container(
              height: height,
              child: Button(
                  operation: (CalculatorModel calculator) =>
                      calculator.operationUnary(_percentage),
                  fillColor: Theme.of(context).buttonColor,
                  splashColor: Theme.of(context).splashColor,
                  child: Text(_percentage.buttonLabel,
                      style: Theme.of(context).textTheme.body1)),
            ),
            plusMinus,
            zero,
            comma,
            plus,
            equals,
          ]),
        ],
      );
    } else {
      table = Table(
        children: [
          TableRow(children: [
            clear,
            restart,
            backspace,
            div,
          ]),
          TableRow(children: [
            seven,
            eigth,
            nine,
            mult,
          ]),
          TableRow(children: [
            four,
            five,
            six,
            minus,
          ]),
          TableRow(children: [
            one,
            two,
            three,
            plus,
          ]),
          TableRow(children: [plusMinus, zero, comma, equals]),
        ],
      );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: Display(),
        ),
        table
      ],
    );
  }
}

class CalculatorUi extends StatelessWidget {
  Widget build(BuildContext context) {
    final CalculatorModel calculator = Provider.of<CalculatorModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: Theme.of(context).appBarTheme.textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.history,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CalculatorHistory(
                              history: calculator.history,
                            )));
              })
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color.fromRGBO(83, 105, 118, 1.0),
              Color.fromRGBO(41, 46, 73, 1.0),
            ],
          ),
        ),
        child: GridButtons(),
      ),
    );
  }
}
