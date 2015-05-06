library string_enum_test;

import 'package:tekartik_utils/string_enum.dart';
import 'package:test/test.dart';

class TwoChoicesEnum extends StringEnum {

  static final TwoChoicesEnum CHOICE1 = new TwoChoicesEnum()..name = "choice1";
  static final TwoChoicesEnum CHOICE2 = new TwoChoicesEnum()..name = "choice2";
}

void main() => defineTests();

void defineTests() {
  test('string enum', () {
    expect(TwoChoicesEnum.CHOICE1.value, "choice1");
    expect(TwoChoicesEnum.CHOICE2.value, "choice2");

  });
}
