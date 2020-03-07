import 'package:calc_mac/models/calculator.dart';
import 'package:calc_mac/classes/display.dart';
import 'dart:math';

abstract class Operator {
  String get buttonLabel;
  String get operatorLabel;

  static String buildFunction(String nameFunc, List<String> params,
      [bool front = true]) {
    String space = ' ';
    String sepParams = ',';
    String startFunc = '(';
    String endFunc = ')';
    String label = startFunc;

    params.forEach((String param) {
      if (param == params.last)
        label += param + endFunc;
      else
        label += param + sepParams + space;
    });

    if (front)
      label = nameFunc + label;
    else
      label = label + nameFunc;

    return label;
  }

  String label(CalculatorData data);
  double operation(CalculatorData data);
}

class Plus implements Operator {
  String get buttonLabel => '\u{002B}';
  String get operatorLabel => '\u{002B}';

  @override
  String label(CalculatorData data) =>
      data.displayA + ' ' + operatorLabel + ' ' + data.displayB;

  @override
  double operation(CalculatorData data) => data.operandA + data.operandB;
}

class Minus implements Operator {
  String get buttonLabel => '\u{2212}';
  String get operatorLabel => '\u{2212}';

  @override
  String label(CalculatorData data) =>
      data.displayA + ' ' + operatorLabel + ' ' + data.displayB;

  @override
  double operation(CalculatorData data) => data.operandA - data.operandB;
}

class Multiplied implements Operator {
  String get buttonLabel => '\u{00D7}';
  String get operatorLabel => '\u{00D7}';

  @override
  String label(CalculatorData data) =>
      data.displayA + ' ' + operatorLabel + ' ' + data.displayB;

  @override
  double operation(CalculatorData data) => data.operandA * data.operandB;
}

class Divided implements Operator {
  String get buttonLabel => '\u{00F7}';
  String get operatorLabel => '\u{00F7}';

  @override
  String label(CalculatorData data) =>
      data.displayA + ' ' + operatorLabel + ' ' + data.displayB;

  @override
  double operation(CalculatorData data) => data.operandA / data.operandB;
}

class PlusMinus implements Operator {
  String _nameFunc = Minus().operatorLabel;
  String get buttonLabel => '\u{00B1}';
  String get operatorLabel => '\u{00B1}';

  @override
  String label(CalculatorData data) =>
      Operator.buildFunction(_nameFunc, [data.displayB]);

  @override
  double operation(CalculatorData data) => data.operandB * -1;
}

class Reciprocal implements Operator {
  String get buttonLabel => '1/x';
  String get operatorLabel => '1/';
  static final double divider = 1;

  @override
  String label(CalculatorData data) =>
      Operator.buildFunction(operatorLabel, [data.displayB]);

  @override
  double operation(CalculatorData data) => divider / data.operandB;
}

class Squared implements Operator {
  String get buttonLabel => '²';
  String get operatorLabel => '²';
  static final double exponent = 2;

  @override
  String label(CalculatorData data) =>
      Operator.buildFunction(operatorLabel, [data.displayB], false);

  @override
  double operation(CalculatorData data) => pow(data.operandB, exponent);
}

class SquareRoot implements Operator {
  String get buttonLabel => '\u{221A}';
  String get operatorLabel => '\u{221A}';

  @override
  String label(CalculatorData data) =>
      Operator.buildFunction(operatorLabel, [data.displayB]);

  @override
  double operation(CalculatorData data) => sqrt(data.operandB);
}

class Percentage implements Operator {
  String get buttonLabel => '\u{0025}';
  String get operatorLabel => '';
  static final double hundred = 100;

  @override
  String label(CalculatorData data) => Display(value: operation(data)).display;

  @override
  double operation(CalculatorData data) {
    final double zero = 0;

    return data.lastOpr == null
        ? zero
        : data.operandA * data.operandB / hundred;
  }
}
