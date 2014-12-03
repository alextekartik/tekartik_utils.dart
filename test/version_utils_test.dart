library version_utils_test;

import 'package:unittest/unittest.dart';
//import 'package:unittest/vm_config.dart';
import 'package:tekartik_utils/version_utils.dart';
import 'package:tekartik_utils/version.dart';

void main() => defineTests();

void defineTests() {
  //useVMConfiguration();
  group('version', () {


    test('parse', () {
      expect(parseVersion('4.3.1'), new Version(4, 3, 1));
      expect(parseVersion('4.3'), new Version(4, 3, 0));
      expect(parseVersion('4.3.1.5'), new Version(4, 3, 1, build: '5'));
      //expect(parseVersion('4'), new Version(4, 0, 0));
    });
  });



}
