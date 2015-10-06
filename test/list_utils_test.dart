library list_utils_tests;

import 'package:test/test.dart';
import 'package:tekartik_utils/list_utils.dart';
import 'package:collection/equality.dart';

main() {
  group('list_utils', () {
    test('equals', () {
      expect(cloneList([]), []);
      expect(identical(cloneList([]), []), isFalse);
    });
  });
}
