class Display {
  final _initialValue = '0';

  final _comma = ',';
  final _zero = '0';
  final _one = '1';
  final _two = '2';
  final _three = '3';
  final _four = '4';
  final _five = '5';
  final _six = '6';
  final _seven = '7';
  final _eight = '8';
  final _nine = '9';

  bool result;
  String _value;
  String get display => _value;
  double get value => double.parse(_value.replaceAll(',', '.'));
  set value(double value) => _value =
      value.toString().replaceAll(RegExp(r'.0+$'), '').replaceAll('.', ',');

  Display({double value = 0}) {
    reset();
    this.value = value;
  }

  void reset() {
    _value = _initialValue;
    result = true;
  }

  void _pressButton(String inc) {
    if (result || _value == _initialValue) {
      _value = inc;
      result = false;
    } else {
      _value += inc;
    }
  }

  void one() => _pressButton(_one);
  void two() => _pressButton(_two);
  void three() => _pressButton(_three);
  void four() => _pressButton(_four);
  void five() => _pressButton(_five);
  void six() => _pressButton(_six);
  void seven() => _pressButton(_seven);
  void eight() => _pressButton(_eight);
  void nine() => _pressButton(_nine);

  bool zero() {
    String oldValue = _value;
    _pressButton(_zero);

    if (RegExp(r'^00').hasMatch(_value)) {
      _value = oldValue;
      return false;
    }

    return true;
  }

  bool comma() {
    if (!result && _value.contains(',')) return false;

    if (_value == _initialValue || result)
      _pressButton(_initialValue + _comma);
    else
      _pressButton(_comma);

    return true;
  }

  bool backspace() {
    if (result || _value == _initialValue) return false;

    int length = _value.length;
    if (_value.contains('-')) length--;

    if (length <= 1) {
      _value = _initialValue;
      return true;
    }

    _value = _value.substring(0, _value.length - 1);
    return true;
  }
}
