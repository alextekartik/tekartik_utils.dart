library dev_utils_test;

import 'package:tekartik_core/dev_utils.dart';
import 'package:test/test.dart';

void main() {
  group('dev_utils', () {
    setUp(() {
      tekartikDevPrintEnabled = false;
    });
    tearDown(() {
      tekartikDevPrintEnabled = true;
    });

    test('devPrint', () {
      tekartikDevPrint("dev print message");
    });
    test('devError', () {
      try {
        tekartikDevError("from test not supported");
        fail('no');
      } catch (e) {}
    });
  });
}
