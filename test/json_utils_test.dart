library json_utils_tests;

import 'package:test/test.dart';
// ignore: deprecated_member_use
import 'package:tekartik_utils/json_utils.dart';

void main() => defineTests();

void defineTests() {
  test('parseJsonObject', () {
    // ignore: deprecated_member_use
    expect(parseJsonObject("456"), equals(null));
    Map obj = {"key": "value"};
    // ignore: deprecated_member_use
    expect(parseJsonObject('{"key":"value"}'), equals(obj));
    // ignore: deprecated_member_use
    expect(parseJsonObject('[{"key":"value"}]'), equals(null));
  });

  test('parseJsonList', () {
    // ignore: deprecated_member_use
    expect(parseJsonList("456"), equals(null));
    List list = [
      {"key": "value"}
    ];
    // ignore: deprecated_member_use
    expect(parseJsonList('[{"key":"value"}]'), equals(list));
  });
}
