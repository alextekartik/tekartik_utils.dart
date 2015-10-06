library tekartik_utils.hex_utils_tests;

import 'package:test/test.dart';
import 'package:tekartik_utils/hex_utils.dart';

main() {
  group('hex utils', () {
    test('Uint4', () {
      expect(hexCodeUint4(0), '0'.codeUnitAt(0));
      expect(hexCodeUint4(9), '9'.codeUnitAt(0));
      expect(hexCodeUint4(10), 'A'.codeUnitAt(0));
      expect(hexCodeUint4(15), 'F'.codeUnitAt(0));
      expect(hexCodeUint4(16), '0'.codeUnitAt(0));
    });

    test('Uint8', () {
      expect(hexUint8(0), '00');
      expect(hexUint8(15), '0F');
      expect(hexUint8(16), '10');
      expect(hexUint8(255), 'FF');
      expect(hexUint8(256), '00');
    });

    test('hexPretty', () {
      expect(hexPretty([0xff]), startsWith('FF'));
      expect(hexPretty([1, 0x23]), startsWith('01 23'));
      expect(hexPretty([1, 2, 3, 4, 5]), startsWith('01 02 03 04  05'));
    });

    test('hexQuickView', () {
      expect(hexQuickView([0xff]), 'FF');
      expect(hexQuickView([1, 0x23]), '01 23');
      expect(hexQuickView([1, 2, 3, 4, 5]), '01 02 03 04  05');
    });

    test('parseHexString', () {
      expect(parseHexString("01 83 3d 79"), [0x01, 0x83, 0x3d, 0x79]);
      expect(hexPretty([1, 0x23]), startsWith('01 23'));
      expect(hexPretty([1, 2, 3, 4, 5]), startsWith('01 02 03 04  05'));
    });
  });
}
