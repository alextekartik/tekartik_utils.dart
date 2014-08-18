import 'package:tekartik_utils/test_utils_browser.dart';
import 'browser_detect_utils_test.dart' as browser_detect_utils_test;
import 'js_utils_browser_test.dart' as js_utils_browser_test;
import 'all_common.dart' as all_common;

main() {
  useHtmlConfiguration();
  browser_detect_utils_test.main();
  js_utils_browser_test.main();
  all_common.main();
  
}