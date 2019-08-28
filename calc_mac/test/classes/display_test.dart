import 'package:test/test.dart';
import 'package:calc_mac/classes/display.dart';

void main() {
  group('Display', () {
    test('value should start at 0', () {
      expect(Display().value, 0);
    });

    test('value should be 12345.67890', () {
      final screen = Display();

      screen.one();
      screen.two();
      screen.three();
      screen.four();
      screen.five();
      screen.comma();
      screen.six();
      screen.seven();
      screen.eight();
      screen.nine();
      screen.zero();

      expect(screen.value, 12345.67890);
    });
  });

  test('value should be 0', () {
    final screen = Display();

    screen.zero();
    screen.zero();
    screen.zero();

    expect(screen.value, 0);
  });

  test('value should be 100', () {
    final screen = Display();

    screen.zero();
    screen.zero();
    screen.one();
    screen.zero();
    screen.zero();

    expect(screen.value, 100);
  });

  test('value should be 0.1', () {
    final screen = Display();

    screen.comma();
    screen.comma();
    screen.one();

    expect(screen.value, 0.1);
  });

  test('reset: value should be 0', () {
    final screen = Display();

    screen.one();
    screen.two();
    screen.three();

    screen.reset();

    expect(screen.value, 0);
  });

  test('result: value should be 1', () {
    final screen = Display();

    screen.one();
    screen.two();
    screen.three();

    screen.result = true;

    screen.one();

    expect(screen.value, 1);
  });

  test('value should be 101', () {
    final screen = Display();

    screen.one();
    screen.zero();
    screen.one();
    screen.zero();

    screen.backspace();

    expect(screen.value, 101);
  });

  test('value should be 0', () {
    final screen = Display();

    screen.one();
    screen.zero();
    screen.one();
    screen.zero();

    screen.backspace();
    screen.backspace();
    screen.backspace();
    screen.backspace();
    screen.backspace();

    expect(screen.value, 0);
  });

  test('value should be 0', () {
    final screen = Display();

    screen.backspace();

    expect(screen.value, 0);
  });

  test('value should be 0', () {
    final screen = Display();

    screen.comma();
    screen.backspace();

    expect(screen.value, 0);
  });

  test('value should be 0.1', () {
    final screen = Display();

    screen.comma();
    screen.one();

    screen.backspace();
    screen.backspace();

    screen.comma();
    screen.one();

    expect(screen.value, 0.1);
  });

  test('value should be 0.1', () {
    final screen = Display();

    screen.comma();
    screen.one();

    screen.backspace();
    screen.backspace();

    screen.comma();
    screen.one();

    expect(screen.value, 0.1);
  });

  test('value should be 1', () {
    final screen = Display();

    screen.result = false;
    screen.one();

    expect(screen.value, 1);
  });
}
