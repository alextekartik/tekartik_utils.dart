import 'browser_detect_utils_common_test.dart' as browser_detect_utils_common_test;
import 'log_utils_test.dart' as log_utils_test;
import 'test_utils_test.dart' as test_utils_test;
import 'string_enum_test.dart' as string_enum_test;
import 'version_utils_test.dart' as version_utils_test;
import 'package:tekartik_utils/dev_utils.dart';
import 'dev_utils_test.dart' as dev_utils_test;
import 'package:unittest/unittest.dart';

main() {
  browser_detect_utils_common_test.main();
  log_utils_test.main();
  string_enum_test.main();
  version_utils_test.main();
  test_utils_test.main();
  group('dev', () {
    setUp(() {
      tekartikDevPrintEnabled = false;
    });
    dev_utils_test.main();
    tearDown(() {
      tekartikDevPrintEnabled = true;
    });
  });




}
