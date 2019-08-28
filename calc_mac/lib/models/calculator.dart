import 'package:flutter/foundation.dart';
import 'package:calc_mac/classes/operators.dart';
import 'package:calc_mac/classes/display.dart';

typedef Procedure = void Function();
typedef ProcedureDouble = double Function();
typedef ProcedureString = String Function();

class CalculatorData {
  double operandA, operandB;
  String displayA, displayB, equation;
  Operator lastOpr;

  CalculatorData(
      {this.operandA,
      this.displayA,
      this.operandB,
      this.displayB,
      this.equation,
      this.lastOpr});

  @override
  String toString() {
    // TODO: implement toString
    return equation + ' ' + displayA;
  }
}

class CalculatorModel extends ChangeNotifier {
  static final _aux = 0;
  static final _operand = 1;
  static final _space = ' ';
  static final _initialValue = '';
  static final _equals = '=';

  bool _unary;
  int _display, _reset;
  String _equation, _lastOperand;
  List<Display> _operands;
  List<CalculatorData> _history;
  Operator _lastOpr;

  CalculatorModel() {
    _history = <CalculatorData>[];
    restart();
  }

  String get display => _operands[_display].display;
  String get equation => _equation;
  List<CalculatorData> get history => _history;

  void restart() {
    _unary = false;
    _reset = 0;
    _display = _operand;
    _operands = [Display(), Display()];
    _equation = _initialValue;
    _lastOperand = _initialValue;
    _lastOpr = null;
    notifyListeners();
  }

  void _pressOperand(Procedure callback) {
    _display = _operand;

    var reset = () {
      _reset = 0;
      _lastOpr = null;
      _equation = _initialValue;
      _operands[_aux].reset();
    };

    if (_reset > 0) reset();

    if (_unary) {
      _unary = false;

      if (_lastOpr == null) {
        _equation += _space + _equals;
        _operands[_aux].value = _operands[_operand].value;
        _history.add(save());
        reset();
      } else {
        _equation =
            _equation.substring(0, _equation.length - _lastOperand.length);
        _lastOperand = _initialValue;
      }
    }

    callback();
    notifyListeners();
  }

  void backspace() {
    if (_display == _operand && !_unary)
      return _pressOperand(() => _operands[_operand].backspace());
  }

  void comma() => _pressOperand(() => _operands[_operand].comma());

  void zero() => _pressOperand(() => _operands[_operand].zero());

  void one() => _pressOperand(() => _operands[_operand].one());

  void two() => _pressOperand(() => _operands[_operand].two());

  void three() => _pressOperand(() => _operands[_operand].three());

  void four() => _pressOperand(() => _operands[_operand].four());

  void five() => _pressOperand(() => _operands[_operand].five());

  void six() => _pressOperand(() => _operands[_operand].six());

  void seven() => _pressOperand(() => _operands[_operand].seven());

  void eight() => _pressOperand(() => _operands[_operand].eight());

  void nine() => _pressOperand(() => _operands[_operand].nine());

  void clear() => _pressOperand(() {
        _unary = false;
        _operands[_operand].reset();
      });

  void _execute(ProcedureDouble values, ProcedureString displays) {
    Display result = Display();

    result.value = values();
    _equation = displays();

    _display = _aux;
    _operands[_aux] = result;
    _operands[_operand].result = true;

    notifyListeners();
  }

  void operationUnary(Operator operator) {
    CalculatorData data = save();
    String operand;

    if (_unary) {
      _equation =
          _equation.substring(0, _equation.length - _lastOperand.length);
      data.displayB = _lastOperand;
    } else {
      _unary = true;

      if (_reset > 0) {
        data.displayA = _operands[_operand].display;
        data.displayB = _operands[_aux].display;
      } else {
        data.displayA = _operands[_aux].display;
        data.displayB = _operands[_operand].display;
      }
    }

    _operands[_operand].value = operator.operation(data);
    _operands[_operand].result = true;
    _display = _operand;

    operand = operator.label(data);
    _lastOperand = operand;

    if (_reset > 0) {
      _reset = 0;
      _lastOpr = null;
      _operands[_aux].reset();
      _equation = _initialValue;
    }

    _equation += operand;

    notifyListeners();
  }

  void operationUnaryAsOperand(Operator operator) {
    CalculatorData data = save();
    if (_reset > 0) data.operandB = _operands[_aux].value;

    if (_unary)
      operationUnary(operator);
    else
      _pressOperand(() => _operands[_operand].value = operator.operation(data));
  }

  void operationBinary(Operator operator) {
    Display oprA = _operands[_aux], oprB = _operands[_operand];
    String operand;
    if (_unary) {
      _unary = false;
      operand = _initialValue;
    } else
      operand = oprB.display;

    if (_lastOpr == null) {
      _execute(() => _operands[_operand].value,
          () => _equation + operand + _space + operator.operatorLabel + _space);
    } else if (_display == _aux) {
      bool boolReset = _reset > 0;
      if (boolReset) _reset = 0;

      _execute(
          () => oprA.value,
          () => boolReset
              ? oprA.display + _space + operator.operatorLabel + _space
              : _equation.substring(
                      0,
                      _equation.length -
                          _lastOpr.operatorLabel.length -
                          _space.length * 2) +
                  _space +
                  operator.operatorLabel +
                  _space);
    } else if (_display == _operand) {
      _execute(() => _lastOpr.operation(save()),
          () => _equation + operand + _space + operator.operatorLabel + _space);
    }

    _lastOpr = operator;
  }

  void equal() {
    if (_reset <= 2) _reset++;

    if (_lastOpr == null) {
      _equation = _operands[_operand].display + _space + _equals;
      _operands[_aux].value = _operands[_operand].value;
      notifyListeners();
    } else {
      Display oprA = _operands[_aux], oprB = _operands[_operand];

      if (_reset < 2) {
        String operand;
        if (_unary) {
          _unary = false;
          operand = _initialValue;
        } else
          operand = oprB.display;

        _execute(() => _lastOpr.operation(save()),
            () => _equation + operand + _space + _equals);
      } else {
        _execute(
            () => _lastOpr.operation(save()),
            () =>
                oprA.display +
                _space +
                _lastOpr.operatorLabel +
                _space +
                oprB.display +
                _space +
                _equals);
      }
    }

    _history.add(save());
  }

  CalculatorData save() => CalculatorData(
      operandA: _operands[_aux].value,
      displayA: _operands[_aux].display,
      operandB: _operands[_operand].value,
      displayB: _operands[_operand].display,
      equation: _equation,
      lastOpr: _lastOpr);

  void load(CalculatorData calcPack) {
    _unary = false;
    _reset = 1;
    _display = _aux;

    _operands[_aux].value = calcPack.operandA;
    _operands[_operand].value = calcPack.operandB;
    _equation = calcPack.equation;
    _lastOpr = calcPack.lastOpr;
  }
}
