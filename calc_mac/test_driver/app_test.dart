import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) driver.close();
  });

  group('Start', () {
    final operand = find.byValueKey('operand'),
        equation = find.byValueKey('equation');

    test('operand start at 0', () async {
      expect(await driver.getText(operand), '0');
    });

    test('equation start at 0', () async {
      expect(await driver.getText(equation), '');
    });
  });

  group('Zero', () {
    final operand = find.byValueKey('operand'),
        zero = find.byValueKey('zero'),
        one = find.byValueKey('one');

    test('double zero', () async {
      await driver.tap(zero);
      await driver.tap(zero);

      expect(await driver.getText(operand), '0');
    });

    test('double zero after operand', () async {
      await driver.tap(one);
      await driver.tap(zero);
      await driver.tap(zero);

      expect(await driver.getText(operand), '100');
    });
  });

  group('Backspace', () {
    final operand = find.byValueKey('operand'),
        backspace = find.byValueKey('backspace');

    test('backspace 2x', () async {
      await driver.tap(backspace);
      await driver.tap(backspace);

      expect(await driver.getText(operand), '1');
    });

    test('backspace finish', () async {
      driver.tap(backspace);

      expect(await driver.getText(operand), '0');
    });

    test('backspace stop', () async {
      await driver.tap(backspace);
      await driver.tap(backspace);

      expect(await driver.getText(operand), '0');
    });
  });

  group('Comma', () {
    final operand = find.byValueKey('operand'),
        backspace = find.byValueKey('backspace'),
        comma = find.byValueKey('comma'),
        one = find.byValueKey('one');

    test('comma start', () async {
      await driver.tap(one);
      await driver.tap(comma);

      expect(await driver.getText(operand), '1,');
    });

    test('comma 2x', () async {
      await driver.tap(comma);
      await driver.tap(one);

      expect(await driver.getText(operand), '1,1');

      await driver.tap(backspace);
      await driver.tap(backspace);
      await driver.tap(backspace);

      assert(await driver.getText(operand) == '0');
    });
  });

  group('Operands', () {
    final operand = find.byValueKey('operand'),
        one = find.byValueKey('one'),
        two = find.byValueKey('two'),
        three = find.byValueKey('three'),
        four = find.byValueKey('four'),
        five = find.byValueKey('five'),
        six = find.byValueKey('six'),
        seven = find.byValueKey('seven'),
        eight = find.byValueKey('eight'),
        nine = find.byValueKey('nine');

    test('operand 1', () async {
      await driver.tap(one);
      expect(await driver.getText(operand), '1');
    });

    test('operand 2', () async {
      await driver.tap(two);
      expect(await driver.getText(operand), '12');
    });

    test('operand 3', () async {
      await driver.tap(three);
      expect(await driver.getText(operand), '123');
    });

    test('operand 4', () async {
      await driver.tap(four);
      expect(await driver.getText(operand), '1234');
    });

    test('operand 5', () async {
      await driver.tap(five);
      expect(await driver.getText(operand), '12345');
    });

    test('operand 6', () async {
      await driver.tap(six);
      expect(await driver.getText(operand), '123456');
    });

    test('operand 7', () async {
      await driver.tap(seven);
      expect(await driver.getText(operand), '1234567');
    });

    test('operand 8', () async {
      await driver.tap(eight);
      expect(await driver.getText(operand), '12345678');
    });

    test('operand 9', () async {
      await driver.tap(nine);
      expect(await driver.getText(operand), '123456789');
    });
  });

  group('Restart', () {
    final operand = find.byValueKey('operand'),
        restart = find.byValueKey('restart');

    test('restart', () async {
      await driver.tap(restart);
      expect(await driver.getText(operand), '0');
    });

    test('restart 2x', () async {
      await driver.tap(restart);
      await driver.tap(restart);

      expect(await driver.getText(operand), '0');
    });
  });

  group('Clear', () {
    final operand = find.byValueKey('operand'),
        clear = find.byValueKey('clear'),
        one = find.byValueKey('one');

    test('clear', () async {
      await driver.tap(one);
      expect(await driver.getText(operand), '1');

      await driver.tap(clear);
      expect(await driver.getText(operand), '0');
    });

    test('clear 2x', () async {
      await driver.tap(clear);
      await driver.tap(clear);

      expect(await driver.getText(operand), '0');
    });
  });

  group('Operator Binary', () {
    final operand = find.byValueKey('operand'),
        equation = find.byValueKey('equation'),
        restart = find.byValueKey('restart'),
        equal = find.byValueKey('equal'),
        plus = find.byValueKey('plus'),
        minus = find.byValueKey('minus'),
        mult = find.byValueKey('multiplied'),
        div = find.byValueKey('divided'),
        two = find.byValueKey('two');

    test('Plus', () async {
      await driver.tap(two);
      await driver.tap(plus);

      expect(await driver.getText(equation), '2 \u{002B} ');
      expect(await driver.getText(operand), '2');

      await driver.tap(two);
      await driver.tap(equal);

      expect(await driver.getText(equation), '2 \u{002B} 2 =');
      expect(await driver.getText(operand), '4');

      await driver.tap(restart);
    });

    test('Minus', () async {
      await driver.tap(two);
      await driver.tap(minus);

      expect(await driver.getText(equation), '2 \u{2212} ');
      expect(await driver.getText(operand), '2');

      await driver.tap(two);
      await driver.tap(equal);

      expect(await driver.getText(equation), '2 \u{2212} 2 =');
      expect(await driver.getText(operand), '0');

      await driver.tap(restart);
    });

    test('Multiplication', () async {
      await driver.tap(two);
      await driver.tap(mult);

      expect(await driver.getText(equation), '2 \u{00D7} ');
      expect(await driver.getText(operand), '2');

      await driver.tap(two);
      await driver.tap(equal);

      expect(await driver.getText(equation), '2 \u{00D7} 2 =');
      expect(await driver.getText(operand), '4');

      await driver.tap(restart);
    });

    test('Divided', () async {
      await driver.tap(two);
      await driver.tap(div);

      expect(await driver.getText(equation), '2 \u{00F7} ');
      expect(await driver.getText(operand), '2');

      await driver.tap(two);
      await driver.tap(equal);

      expect(await driver.getText(equation), '2 \u{00F7} 2 =');
      expect(await driver.getText(operand), '1');

      await driver.tap(restart);
    });

    group('Behavior', () {});
  });
}
