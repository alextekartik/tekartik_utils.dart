library dev_utils_test;

import 'package:tekartik_utils/dev_utils.dart';
import 'package:unittest/unittest.dart';


void main() {
  group('dev_utils', () {
    test('devPrint', () {

      tekartikDevPrint("dev print message");

    });
    test('devError', () {
      try {
        tekartikDevError("from test not supported");
        fail('no');
      } catch (e) {

      }

    });
  });
}
