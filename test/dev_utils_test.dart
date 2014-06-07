library string_enum_test;

import 'package:tekartik_utils/dev_utils.dart';
import 'package:unittest/unittest.dart';


void main() {
  test('devError', () {
    try {
      devError("from test not supported");
      fail('no');
    } catch (e) {
      
    }
    
  });
}