import 'browser_detect_utils_common_test.dart' as browser_detect_utils_common_test;
import 'log_utils_test.dart' as log_utils_test;
import 'string_enum_test.dart' as string_enum_test;
import 'version_utils_test.dart' as version_utils_test;
import 'package:tekartik_core/dev_utils.dart';
import 'dev_utils_test.dart' as dev_utils_test;
import 'json_utils_test.dart' as json_utils_test;
import 'uri_utils_test.dart' as uri_utils_test;
import 'package:unittest/unittest.dart';

main() {
  browser_detect_utils_common_test.defineTests();
  log_utils_test.defineTests();
  string_enum_test.defineTests();
  version_utils_test.defineTests();
  json_utils_test.defineTests();
  uri_utils_test.defineTests();
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
