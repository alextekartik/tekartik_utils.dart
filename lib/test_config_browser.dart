library tekartik_test_config_browser;

import 'package:unittest/html_config.dart' as cfg;
import 'package:unittest/unittest.dart';
import 'test_config.dart';

final _configuration = new ConfigurationBrowser();

void useHtmlConfiguration() {
  unittestConfiguration = _configuration;
}

class ConfigurationBrowser extends cfg.HtmlConfiguration with DebugConfiguration {

  ConfigurationBrowser() : super(false) {
    debugOnCreate(this);
  }

  @override
  void onTestStart(TestCase testCase) {
    debugOnTestStart(testCase);
    super.onTestStart(testCase);

  }

  @override
  void onTestResult(TestCase testCase) {
    debugOnTestResult(testCase);
    super.onTestResult(testCase);
  }
}
//import 'package:idb_shim/idb_client.dart';

//IdbFactory idbFactory;
