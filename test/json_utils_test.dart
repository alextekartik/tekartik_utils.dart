library json_utils_tests;

import 'package:test/test.dart';
import 'package:tekartik_utils/json_utils.dart';

void main() => defineTests();

void defineTests() {
  test('parseJsonObject', () {
    expect(parseJsonObject("456"), equals(null));
    Map obj = {
               "key": "value"
    };
    expect(parseJsonObject('{"key":"value"}'), equals(obj));
    expect(parseJsonObject('[{"key":"value"}]'), equals(null));
  });
  
  test('parseJsonList', () {
    expect(parseJsonList("456"), equals(null));
    List list = [{
      "key": "value"
    }];
    expect(parseJsonList('[{"key":"value"}]'), equals(list));
  });
 
}